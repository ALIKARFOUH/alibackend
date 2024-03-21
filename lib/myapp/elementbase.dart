import 'package:flutter/material.dart';

class ElementBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE8DCCE),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                height: 50,
                color: Color(0xFFE8DCCE),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
