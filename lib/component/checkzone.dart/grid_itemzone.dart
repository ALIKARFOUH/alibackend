import 'package:flutter/material.dart';

class GridItemzone extends StatelessWidget {
  final Widget? icon;
  final Widget? image;
  final Widget? video;
  final IconData? expandIcon;
  final Widget destination; // Destination page for navigation

  const GridItemzone(
      {Key? key,
      this.icon,
      required this.image,
      required this.video,
      this.expandIcon,
      required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          margin: EdgeInsets.all(8),
          width: 200,
          decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(10), // Border radius here
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    // Handle icon expand or show more details
                  },
                ),
              if (image != null) image!,
              if (video != null) video!,
              if (expandIcon != null)
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    // Handle icon expand or show more details
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
