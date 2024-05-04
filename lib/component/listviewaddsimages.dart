import 'package:flutter/material.dart';
import 'package:namer_app/component/data_service.dart';
import 'package:namer_app/component/menubar.dart';
import 'package:namer_app/models/form_model.dart';
import 'package:namer_app/myapp/SliderExample.dart';

class ListViewAdds extends StatelessWidget {
  final List<FormModel> data;

  const ListViewAdds({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("data"),
              ImageSliderPage(),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index].url),
                      radius: 30,
                    ),
                    title: Text(
                      data[index].description,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
        bottomNavigationBar: Menubar(
          currentIndex: 0,
          selectedIconColor: Color.fromARGB(255, 246, 148, 62),
        ));
  }
}
