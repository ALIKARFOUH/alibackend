
import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {
  final String text;

  const DetailPage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}

