import 'package:flutter/material.dart';

class Passwordtextfield  extends StatelessWidget {
  final String hinttext;
  final TextEditingController texteditingcontroller ;
   
const   Passwordtextfield  ({super.key, required this.texteditingcontroller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return 
      Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: TextFormField (decoration: InputDecoration(hintText: hinttext ,labelText: 'password field ',border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),),prefixIcon: Icon(Icons.lock),),),// preparer le text field de nom d utilisateur 
      );
  }
}