import 'package:flutter/material.dart';

class TextSubtitles extends StatelessWidget {
  final String customText;

  const TextSubtitles({Key? key, required this.customText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      style: TextStyle(
        color: Colors.black, // Change subtitle color
        fontStyle: FontStyle.italic, // Apply italic style
        fontSize: 16.0, // Change font size
      ),
    );
  }
}


