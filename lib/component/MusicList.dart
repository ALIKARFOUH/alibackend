import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart' as audio_players;
import 'package:namer_app/component/Listview_music.dart';
import 'package:just_audio/just_audio.dart';

class MusicWidget extends StatefulWidget {
  @override
  _MusicWidgetState createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  List<AudioPlayer> audioPlayers = [];
  List<dynamic> data = [];
  double _volume = 0.5;
  bool isLoading = true;
  bool isError = false;
  int currentPlayingIndex = -1;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      List<dynamic>? fetchedData = await datamusic.getAllMusic();
      if (fetchedData != null) {
        setState(() {
          data = fetchedData;
          audioPlayers = List.generate(data.length, (_) => AudioPlayer());
          for (int i = 0; i < data.length; i++) {
            _initializeAudioPlayer(data[i]['soundUrl'], i);
          }
          isLoading = false;
        });
      } else {
        _handleError();
      }
    } catch (e) {
      print('Error fetching data: $e');
      _handleError();
    }
  }

  void _handleError() {
    setState(() {
      isError = true;
      isLoading = false;
    });
  }

  void _initializeAudioPlayer(String audioUrl, int i) async {
    await audioPlayers[i].setUrl(audioUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isError
              ? Center(child: Text('Error fetching data.'))
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      _buildMusicItem(index, data[index]),
                ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildMusicItem(int index, dynamic item) {
    String musicName = _extractMusicName(item['soundUrl']);
    return ListTile(
      title: Text(musicName),
      trailing: IconButton(
        onPressed: () => _togglePlayPause(index),
        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  void _togglePlayPause(int index) {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        _playAudio(index);
      } else {
        audioPlayers[index].pause();
      }
    });
  }

  String _extractMusicName(String audioUrl) {
    RegExp regex = RegExp(r'/([^/]+)\.mp3$');
    Match? match = regex.firstMatch(audioUrl);
    return match != null ? match.group(1) ?? '$match' : 'Unknown Name';
  }

  void _setVolume(int index, double volume) {
    audioPlayers[index].setVolume(volume);
  }

  void _playAudio(int index) {
    if (currentPlayingIndex != -1) {
      audioPlayers[currentPlayingIndex].stop();
    }
    audioPlayers[index].play();
    currentPlayingIndex = index;
  }

  @override
  void dispose() {
    for (var player in audioPlayers) {
      player.dispose();
    }
    super.dispose();
  }
}
