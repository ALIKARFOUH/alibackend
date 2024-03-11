import 'package:flutter/material.dart';
import 'package:namer_app/component/textsubtitels.dart';
 

class Menulist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ColoredBox(
        color: Colors.white,
        child: Material(
          child: ListTile(
            title: Text('Menu'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSubtitles(customText:'hello '),
                TextSubtitles(customText:'hello '),
                TextSubtitles(customText:'hello '),
                TextSubtitles(customText:'hello ')
              ],
            ),
          ),
        ),
      ),
    );
  }
}