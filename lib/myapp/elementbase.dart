import 'package:flutter/material.dart';
class ElementBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
      
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Stack( alignment: Alignment.bottomCenter,children: [
      Column(
        children: [ 
           
          Expanded(
            child: Container(),
          ),
         
          Container(
            height: 50,
            color: Colors.deepPurple[400],
          ),
        ],
      ),
    
      ],
      ),
    );
  }
}
