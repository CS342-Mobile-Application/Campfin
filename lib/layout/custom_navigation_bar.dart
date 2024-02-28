import 'package:flutter/material.dart';
import 'package:mobile_campfin/screens/home.dart';
import 'package:mobile_campfin/screens/places.dart';
import 'package:mobile_campfin/screens/shop.dart';
import 'package:mobile_campfin/screens/trips.dart';


class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);
  @override
  _CustomNavigationBarState  createState() => _CustomNavigationBarState ();
}

class _CustomNavigationBarState  extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  void onTappedBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
    const  Home(),
     const Trips(),
     const Places(),
     const Shop(),
    ];
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (tap) => onTappedBar(tap),
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', 
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active), label: 'Trips'),
          BottomNavigationBarItem(
              icon: Icon(Icons.place), label: 'Places'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Shop'),
     
        
        ],
      ),
    );
  }
}
