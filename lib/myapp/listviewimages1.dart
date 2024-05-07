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
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: Offset(-10.0, 10.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 30,
                              child: SizedBox(
                                width: 400, // Set the width of the container
                                child: Row(
                                  children: [
                                    Card(
                                      elevation: 10,
                                      shadowColor: Colors.grey.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        height: 200,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(item.url),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 80,
                                    ), // Add spacing between the image and the text
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 45,
                              left: 160,
                              child: SizedBox(
                                height: 150,
                                width: 180,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.description,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepPurple[400],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Divider(
                                              height: 5,
                                              thickness: 2,
                                              color: Colors.grey[300],
                                              indent: 25,
                                            ),
                                            SizedBox(width: 30),
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
                                                color: Color.fromARGB(
                                                    255, 246, 148, 62),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: PopupMenuButton<String>(
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Colors.deepPurple[
                                              400], // Change the color of the icon
                                        ),
                                        onSelected: (String result) {
                                          if (result == 'Edit') {
                                            // Handle edit action
                                          } else {
                                            DataService.deleteImage(item.id!);
                                            getData();
                                          }
                                        },
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[
                                          PopupMenuItem<String>(
                                            value: 'Edit',
                                            child: ListTile(
                                              leading: Icon(Icons.edit,
                                                  color: Colors
                                                      .deepPurple), // Play icon
                                              title: Text('Edit'),
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                            value: 'Delete',
                                            child: ListTile(
                                              leading: Icon(Icons.delete,
                                                  color: Colors
                                                      .deepPurple), // Play icon
                                              title: Text('delete'),
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                            value: 'Stream now',
                                            child: ListTile(
                                              leading: Icon(Icons.play_arrow,
                                                  color: Colors
                                                      .deepPurple), // Play icon
                                              title: Text('Stream now'),
                                            ),
                                            
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
