import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/component/data_service.dart';
import 'package:namer_app/models/form_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderPage extends StatefulWidget {
  @override
  _ImageSliderPageState createState() => _ImageSliderPageState();
}

class _ImageSliderPageState extends State<ImageSliderPage> {
  int activeIndex = 0;
  final controller = CarouselController();
  List<FormModel> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    List<FormModel> fetchedData = await DataService.getImages();
    setState(() {
      data = fetchedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(height: 30),
      Expanded(
        child: SizedBox(
          width: double.infinity,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return SizedBox(
                  child: Row(
                    children: [
                      Image.network(
                        item.url,
                        width: 150,
                      ),
                      SizedBox(width: 15),
                      Text(item.description),
                      SizedBox(width: 15),
                      PopupMenuButton<String>(
                        onSelected: (String result) {
                          if (result == 'Edit') {
                          } else {
                            DataService.deleteImage(item.id!);
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
                          PopupMenuItem<String>(
                            value: 'Stream Now',
                            child: Text('Stream Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    ]));
  }

  Widget buildImage(String urlImage, int index) => Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Text(urlImage),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
            dotWidth: 10, activeDotColor: Colors.deepPurple),
        activeIndex: activeIndex,
        count: data.length,
      );
}
