import 'package:flutter/material.dart';
import 'package:mobile_campfin/layout/custom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
       appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          //fontWeight: FontWeight.bold,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 236, 177, 0),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
         backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        

      ),
      home: CustomNavigationBar( ),
    );
  }
}
