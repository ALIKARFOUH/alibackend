import 'package:flutter/material.dart';
import 'package:namer_app/component/menubar.dart';


class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title:  Row( children:[ CircleAvatar(backgroundImage: AssetImage('lib/images/datadoit_logo.jpg'), radius: 20 ,),SizedBox(width:8) , ] ,),backgroundColor:Colors.deepPurple[400],),// add logodatadoit
     
   
      body: Center(child: Text('First Page Content')),
      bottomNavigationBar: Menubar(currentIndex: 0),
    );
      
  
    

    

  }}