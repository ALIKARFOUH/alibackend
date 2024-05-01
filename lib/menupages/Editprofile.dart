import 'package:flutter/material.dart';

class Editprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/images/datadoit_logo.jpg'),
              radius: 20,
            ),
            SizedBox(width: 8),
          ],
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(19),
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                const CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage("lib/images/datadoit_logo.jpg"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          buildTextField('Full Name', Icons.person, nameController),
          const SizedBox(height: 30),
          buildTextField('Email', Icons.email, emailController),
          const SizedBox(height: 30),
          buildTextField('Phone Nmb', Icons.phone, phoneController),
          const SizedBox(height: 30),
          buildTextField('Password', Icons.lock, passwordController),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Color.fromARGB(255, 246, 148, 62),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/menu');
            },
            child: Container(
              margin: EdgeInsets.all(15),
              child: const Text(
                'Confirm',
                style: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

//class ProfileEdit extends StatefulWidget {
//const ProfileEdit({super.key});

@override
// ignore: library_private_types_in_public_api
// _ProfileEditState createState() => _ProfileEditState();
//}

//class _ProfileEditState extends State<ProfileEdit> {
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void editProfile() {}

// @override
//  void initState() {

//   super.initState();
//  nameController.text = cUser.name;
//  emailController.text = cUser.email;
//  phoneController.text = cUser.phone;
//  passwordController.text = cUser.pwd;

//}

Widget buildTextField(
    String label, IconData icon, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(255, 166, 14, 200),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold, // Set fontWeight to bold
        fontSize: 12, // Set smaller font size
      ),
    ),
    obscureText: label == 'Password' ? true : false,
  );
}
