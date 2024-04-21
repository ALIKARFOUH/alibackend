import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback function; // Destination page for navigation

  const GridItem(
      {Key? key,
      required this.text,
      required this.icon,
      required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
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
              Icon(icon, size: 50, color: Colors.black), // Customize the icon
              SizedBox(height: 8),
              Text(
                text,
                style: TextStyle(
                    fontSize: 20, color: Colors.black), // Customize the text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
