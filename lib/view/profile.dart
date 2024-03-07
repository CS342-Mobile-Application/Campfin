import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'John Doe';
  String email = 'john@gmail.com';

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),          
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'assets/images/profileImage.png'), // Your profile picture
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Sarawut inpol', // User's name
                          style:
                              TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 69, 69, 69)

                              ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '6510405822', // User's email
                          style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 69, 69, 69)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
