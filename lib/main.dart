import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/layout/custom_navigation_bar.dart';
import 'package:mobile_campfin/middleware/AuthMiddleware.dart';
import 'package:mobile_campfin/services/AuthService.dart';
import 'package:mobile_campfin/view/create_trip.dart';
import 'package:mobile_campfin/view/login.dart';
import 'package:mobile_campfin/view/profile.dart';
import 'package:mobile_campfin/view/register.dart';
import 'package:mobile_campfin/view/trip_detail.dart';
import 'package:mobile_campfin/view/trips.dart';

void main() {
  Get.put(AuthService());
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {

  const MyApp({Key? key,}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState(
  );
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
    return GetMaterialApp.router(
      
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
                  color: Colors.black,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 16.0,
                  color: Colors.black,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 20.0,
              color: Colors.black,
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
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            selectedItemColor: Color.fromARGB(255, 0, 158, 175),
            unselectedItemColor: Colors.black,
          ),
          listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            selectedTileColor: Color.fromARGB(255, 80, 60, 60),
            iconColor: Color.fromARGB(255, 80, 60, 60),
            subtitleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          )),
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
            name: '/register',
            page: () => const Register(),
            middlewares: [AuthMiddleware(context)]),
        GetPage(
            name: '/login',
            page: () => const Login(),
            middlewares: [AuthMiddleware(context)]),
        GetPage(
            name: '/home',
            page: () => const CustomNavigationBar(),
            middlewares: [AuthMiddleware(context)]),
        GetPage(
            name: '/trips',
            page: () => const Trips(),
            middlewares: [AuthMiddleware(context)]),
        GetPage(
            name: '/trip-detail',
            page: () => const TripDetail(),
            middlewares: [AuthMiddleware(context)]),
        GetPage(
            name: '/profile',
            page: () => const Profile(),
            middlewares: [AuthMiddleware(context)]),
        GetPage(
            name: '/create-trip',
            page: () => const CreateTrip(),
            middlewares: [AuthMiddleware(context)]),
      ],
      
      
      
    );
  }
}
