import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/component/data_service.dart';
import 'package:namer_app/component/listviewaddsimages.dart';
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
      Text("data"),
      SizedBox(height: 30),
      SizedBox(
        height: 200,
        width: 200,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: ((context, index) {
            final imageurl = data[index].url;
            return Text(imageurl);
          }),
        ),
      )
    ]));
  }

  Widget buildImage(String urlImage, int index) => Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Image.network(urlImage, fit: BoxFit.cover),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
            dotWidth: 10, activeDotColor: Colors.deepPurple),
        activeIndex: activeIndex,
        count: data.length,
      );
}
// List<FormModel> data = [];