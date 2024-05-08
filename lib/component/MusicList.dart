import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart' as audioplayers;
import 'package:namer_app/component/Listview_music.dart';
import 'package:just_audio/just_audio.dart';

class MusicWidget extends StatefulWidget {
  @override
  State<MusicWidget> createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  late List<AudioPlayer> audioPlayers;
  late List<dynamic> data;
  late double _volume = 0.5;
  bool isLoading = true;
  bool isError = false;
  late int currentPlayingIndex;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    getData();
    currentPlayingIndex = -1;
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
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  void _initializeAudioPlayer(String audioUrl, int i) async {
    audioPlayers[i] = AudioPlayer();
    await audioPlayers[i].setUrl(audioUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : isError
              ? Center(
                  child: Text('Error fetching data.'),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: data
                      .asMap()
                      .entries
                      .map((entry) => _buildMusicItem(entry.key, entry.value))
                      .toList(),
                ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildMusicItem(int index, dynamic item) {
    String musicName = _extractMusicName(item['soundUrl']);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 230,
            margin: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.black,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(musicName),
                  IconButton(
                    onPressed: () => _togglePlayPause(index),
                    iconSize: 64,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  ),
                  Slider(
                    // Champ de volume
                    value: _volume,
                    onChanged: (newValue) {
                      setState(() {
                        _volume = newValue;
                      });
                      _setVolume(index, newValue);
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _pause(index),
                icon: Icon(Icons.pause),
              ),
              IconButton(
                onPressed: () => _stop(index),
                icon: Icon(Icons.stop),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Nom de la musique: $musicName",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _togglePlayPause(int index) {
    setState(() {
      print(isPlaying);
      _playAudio(index);

      if (currentPlayingIndex == index) {
        if (isPlaying) {
          audioPlayers[index]
              .pause(); // Met en pause la piste actuellement en lecture
        } else {
          _playAudio(index);
        }
        isPlaying = !isPlaying; // Inverse l'état de lecture
      } else {
        if (currentPlayingIndex != -1) {
          audioPlayers[currentPlayingIndex]
              .stop(); // Arrête la piste actuellement en lecture
        }
        audioPlayers[index].play(); // Joue la piste cliquée
        currentPlayingIndex =
            index; // Met à jour l'index de la piste actuellement en lecture
        isPlaying = true; // Définit l'état de lecture à vrai
      }
    });
  }

  String _extractMusicName(String audioUrl) {
    // Supposons que l'URL ait le format suivant : http://exemple.com/nom_de_la_musique.mp3
    RegExp regex = RegExp(
        r'/([^/]+)\.mp3$'); // Expression régulière pour extraire le nom de fichier MP3
    Match? match = regex.firstMatch(audioUrl);
    if (match != null) {
      return match.group(1) ??
          '$match'; // Retourne le nom de la musique extrait
    } else {
      return 'Nom inconnu :/ ';
    }
  }

  void _setVolume(int index, double volume) {
    audioPlayers[index].setVolume(volume);
  }

  void _playAudio(int index) {
    print('è-----------------------------');
    print(index);
    for (int i = 0; i < audioPlayers.length; i++) {
      if (i == index) {
        audioPlayers[i].play();
      } else {
        audioPlayers[i].stop();
      }
    }
  }

  void _pause(int index) {
    audioPlayers[index].pause();
  }

  void _stop(int index) {
    audioPlayers[index].stop();
  }

  @override
  void dispose() {
    for (var player in audioPlayers) {
      player.dispose();
    }
    super.dispose();
  }
}
