import 'package:flutter/material.dart';
import 'package:mobile_campfin/layout/custom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
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
          textTheme: const TextTheme(
            displaySmall: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 34.0,
                fontWeight: FontWeight.bold),
            displayMedium: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 38.0,
                fontWeight: FontWeight.bold),
            displayLarge: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 42.0,
                fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
            bodySmall: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 14.0,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 16.0,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 20.0,
            ),

            // Add more text styles as needed
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            //fontWeight: FontWeight.bold,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Kanit',
            ),
            elevation: 0,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 236, 177, 0),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        home: CustomNavigationBar(),
        );
  }
}
