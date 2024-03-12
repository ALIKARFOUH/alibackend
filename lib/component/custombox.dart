import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomBox({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 16),
            Text(text),
          ],
        ),
      ),
    );
  }
}