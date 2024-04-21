import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/component/menubar.dart';
import 'package:namer_app/models/form_model.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<FormModel> data = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection("ads").get();

    setState(() {
      data = querySnapshot.docs.map((documentSnapshot) {
        return FormModel.fromJson(documentSnapshot.data());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/images/datadoit_logo.jpg'),
              radius: 20,
            ),
            SizedBox(width: 8),
          ],
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: data.isNotEmpty
          ? ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Image.network(
                      data[index].url,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(data[index].description),
                  ],
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: Menubar(
        currentIndex: 0,
        selectedIconColor: Color.fromARGB(255, 246, 148, 62),
      ),
    );
  }
}
