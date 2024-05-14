import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:namer_app/component/data_service.dart';
import 'package:namer_app/models/form_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderPageess extends StatefulWidget {
  @override
  _ImageSliderPageessState createState() => _ImageSliderPageessState();
}

class _ImageSliderPageessState extends State<ImageSliderPageess> {
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
      backgroundColor: Colors.white,
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
                            'lib/images/image (1).png',
                            height: 60,
                            width: 75,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "your Images",
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
          SizedBox(height: 10),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.grey.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 250, // Updated height to 230
                            width: 130, // Updated width to 200
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(item.url),
                              ),
                            ),
                          ),
                          title: Text(
                            item.description,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.deepPurple[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Divider(
                                height: 5,
                                thickness: 2,
                                color: Colors.grey[300],
                                indent: 25,
                              ),
                              SizedBox(height: 10),
                              Text(
                                item.age,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item.gender,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 246, 148, 62),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton<String>(
                            onSelected: (String result) {
                              if (result == 'Edit') {
                                // Handle Edit action
                              } else if (result == 'Delete') {
                                DataService.deleteImage(item.id!);
                                getData();
                              } else if (result == 'StreamNow') {
                                // Handle Stream Now action
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'Edit',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.deepPurple,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Edit',
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Delete',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.deepPurple,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Delete',
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'StreamNow',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.live_tv,
                                      color: Colors.deepPurple,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Stream Now',
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Widget buildImage(String urlImage, int index) => Container(
        height: 230,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(58),
          ),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Text(urlImage),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
          dotWidth: 10,
          activeDotColor: Colors.deepPurple,
        ),
        activeIndex: activeIndex,
        count: data.length,
      );
}
