import 'package:flutter/material.dart';


class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทริป'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Trips',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
