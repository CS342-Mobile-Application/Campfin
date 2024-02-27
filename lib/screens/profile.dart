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
        title: Text('โปรไฟล์'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'โปรไฟล์',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
