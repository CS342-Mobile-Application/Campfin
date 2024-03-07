import 'package:flutter/material.dart';


class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ร้านค้า'),
           actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.account_circle,
                  color: Colors.black, size: 40.0),
              onPressed: () {
                         Navigator.pushNamed(context, '/profile');
              }),
        ],
      ),
      //create contianer width 100 height 100
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container (
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          width: double.infinity,
          height: double.infinity,
          child:  Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/work-in-progress.png', width: 140, height: 140),
                const SizedBox(height: 12),
                const Text('ยังไม่เปิดใช้งานในขณะนี้', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 69, 69, 69), fontWeight: FontWeight.bold)),             
              ]
            )
          )
        )
        
      ),
    );

  }
}