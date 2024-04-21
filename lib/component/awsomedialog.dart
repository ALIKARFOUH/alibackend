

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Awsomedialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              AnimatedButton(
                  text: "Are you sure to log out",
                  color: Colors.deepPurple,
                  pressEvent: () {
                   AwesomeDialog(
            context: context,
            dialogType:DialogType.warning,animType:AnimType.topSlide,showCloseIcon: true,title: "warning",desc: "the log out may result forgetting all your data ",btnCancelOnPress: (){},btnOkOnPress:(){} );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
