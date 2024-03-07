import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NavigationBar extends StatefulWidget {
  final int selectedIndex;

  const NavigationBar({
    Key? key,
    this.selectedIndex = 0,

  }) : super(key: key);

 
void onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/');
        break;
      case 1:
        Get.toNamed('/trips');
        break;
      case 2:
        Get.toNamed('/shop');
        break;
      case 3:
        Get.toNamed('/profile');
        break;
      default:
        throw Exception('Invalid index');
    }
  }




  @override
  _NavigationBarState createState() =>
      _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap:(selectIndex){
        widget.onItemTapped(selectIndex);
      },
      currentIndex: widget.selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: 'Trips',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: 'Places',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Shop',
        ),
      ],
    );
  }
}
