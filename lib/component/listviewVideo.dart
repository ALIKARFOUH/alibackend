import 'package:flutter/material.dart';
import 'package:namer_app/models/video_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:namer_app/component/Video_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class Listviewvideo extends StatefulWidget {
  @override
  _ListviewvideoState createState() => _ListviewvideoState();
}

class _ListviewvideoState extends State<Listviewvideo> {
  int activeIndex = 0;
  final controller = CarouselController();
  List<VideoModel> data = [];
  late List<VideoPlayerController> videoControllers;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    for (var controller in videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> getData() async {
    List<VideoModel> fetchedData = await DataService.getvideos();
    setState(() {
      data = fetchedData;
      videoControllers =
          List.generate(data.length, (_) => VideoPlayerController.network(""));
      for (int i = 0; i < data.length; i++) {
        _initializeVideoPlayer(data[i].url, i);
      }
    });
  }

  void _initializeVideoPlayer(String videoUrl, int index) {
    videoControllers[index] = VideoPlayerController.network(videoUrl);
    videoControllers[index].addListener(() {
      if (videoControllers[index].value.hasError) {
        print('Video Error: ${videoControllers[index].value.errorDescription}');
      }
    });
    videoControllers[index].setLooping(true);
    videoControllers[index].initialize().then((_) {
      // Pause the video when initialized
      videoControllers[index].pause();
      // Notify the widget to rebuild
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Colors.deepPurple[300],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 88,
                  left: 8,
                  child: Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            'lib/images/chat-video.png',
                            height: 60,
                            width: 75,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "your videos",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 30,
                              color: Colors.deepPurple[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              height: 230,
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    child: Material(
                      elevation: 4,
                      child: Container(
                        height: 180.0,
                        width: 290,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: Offset(-10.0, 10.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView.separated(
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 10), // Espacement entre les vidéos
                itemBuilder: (context, index) {
                  final item = data[index];
                  return SizedBox(
                    child: Row(
                      children: [
                        if (data.isNotEmpty && index < videoControllers.length)
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (videoControllers[index]
                                        .value
                                        .isPlaying) {
                                      videoControllers[index].pause();
                                    } else {
                                      videoControllers[index].play();
                                    }
                                  });
                                },
                                child: Container(
                                  height: 230,
                                  width: 290,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  color: Colors.black,
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: VideoPlayer(videoControllers[index]),
                                  ),
                                ),
                              ),
                              if (!videoControllers[index].value.isPlaying)
                                Center(
                                  child: IconButton(
                                    icon: Icon(Icons.play_arrow),
                                    onPressed: () {
                                      setState(() {
                                        videoControllers[index].play();
                                      });
                                    },
                                  ),
                                ),
                            ],
                          ),
                        SizedBox(width: 15),
                        Text(item.description),
                        SizedBox(width: 15),
                        PopupMenuButton<String>(
                          onSelected: (String result) {
                            if (result == 'Edit') {
                              // modifier le
                            } else {
                              DataService.deleteVideo(item.id!);
                              getData();
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'Edit',
                              child: Text('Edit'),
                            ),
                            PopupMenuItem<String>(
                              value: 'Delete',
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
          dotWidth: 10,
          activeDotColor: Colors.deepPurple,
        ),
        activeIndex: activeIndex,
        count: data.length,
      );
}
