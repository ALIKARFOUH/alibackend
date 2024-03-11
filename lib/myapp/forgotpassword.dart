import 'package:flutter/material.dart';
import 'package:namer_app/myapp/resetpassword.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(  
      
        backgroundColor: Colors.deepPurple[400], 
      ),
      body: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left: 110, right: 0, top: 20, bottom: 20),
            child: Text(
              'Forgot password',
              style: TextStyle(color: Color.fromARGB(255, 245, 173, 110), fontSize: 40),
            ),
          ),
             
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Please enter the mail here',
                labelText: 'mail field',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.mail),
              ),
            ), 
            ),
             SizedBox(height: 100),

        Center(
  child: SizedBox(
    width: 200, // Set the desired width
    height: 50, // Set the desired height
    child: ElevatedButton(
      onPressed:(){
        Navigator.push(context,MaterialPageRoute(builder:(context)=>Resetpassword()),);
      }
      ,style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 246, 148, 62)),
      ),
      child: Text('Reset', style: TextStyle(color: Colors.black)),

),
  ),
),
       Expanded(
            child: Container(),
          ),
         
          Container(
            height: 50,
            color: Colors.deepPurple[400],
          ), ],
      ),
    );
  }
}