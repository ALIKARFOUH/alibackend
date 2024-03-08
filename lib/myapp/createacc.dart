import 'package:flutter/material.dart';


class Createacc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.deepPurple[400],),
       body: Column(
         children: [SizedBox(height:80),
           Center(child:   Padding(padding: const EdgeInsets.only (left:110, right:0, top: 20, bottom: 20),child: Text('Create new account',style: TextStyle(color: Color.fromARGB(255, 245, 173, 110),fontSize:40),),)),SizedBox(height: 50),Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child:   TextField(decoration: InputDecoration(hintText: ' Please enter your name   ',labelText: 'name field',border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),),prefixIcon: Icon(Icons.person),),)),SizedBox(height: 20),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child:TextField(decoration: InputDecoration(hintText: 'Please enter your email here  ',labelText: 'emailfield',border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),),prefixIcon: Icon(Icons.email),),)),SizedBox(height: 20),Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child:  TextField(decoration: InputDecoration(hintText: 'Please enter the pasword here  ',labelText: 'password field',border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),),prefixIcon: Icon(Icons.lock),),),)
            ,SizedBox(height: 50),SizedBox( width: 250,height:55


            ,
              child: ElevatedButton(onPressed:null ,style:ButtonStyle(   backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 246, 148, 62), ), padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 50, vertical: 20)),),  
              child:Text('SIGN UP',style: TextStyle(color: Colors.black),), ),
            ), SizedBox(height: 20),
           
         Expanded(// purple box down 
              child: Container(),
            ),
            Container(
              height: 50, // 
              color: Colors.deepPurple[400], 
             
            ),
         
         ],
       
       
  
  
  
  
  
        ),
      
    );
  }}