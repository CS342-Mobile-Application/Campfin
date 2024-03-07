import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/view/create_trip.dart';
import 'package:mobile_campfin/view/profile.dart';
import 'package:mobile_campfin/view/trip_detail.dart';

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
        title: const Text('ทริป'),
           actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.account_circle,
                  color: Colors.black, size: 40.0),
              onPressed: () {
                Get.to(const Profile());


              }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Search',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 80, 60, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  const Text('10 ทริปกำลังเดินทาง', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                  
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/create-trip');
                      Get.to(const CreateTrip());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 80, 60, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('สร้างทริป'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    TripCard(),
                    SizedBox(height: 8),
                    TripCard(),
                    SizedBox(height: 8),
                    TripCard(),
                  ]
                ),
              ),
              

            ],
          ),
        ),
      ),
    );
  }
  
}


class TripCard extends StatelessWidget {
  const TripCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Get.to(const TripDetail());
      },
      child: Stack(
        children: [
          Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            // Define the shape of the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            // Define how the card's content should be clipped
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // Define the child widget of the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Add padding around the row widget
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Add an image widget to display an image
                      Image.asset(
                        'assets/images/campfinLogo.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      // Add some spacing between the image and the text
                      const SizedBox(width: 20),
                      // Add an expanded widget to take up the remaining horizontal space
                       Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            const Text(
                              "Fri, Apr 23 •6:00 PM",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const Text(
                              "Cards Title 1",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5 ,bottom: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 177, 0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "เข้าร่วมแล้ว 10 คน",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),  
                      
                            const Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  "อุทยานแห่งชาติเขาใหญ่",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // Add your save functionality here
              },
            ),
          ),
        ],
      ),
    );
  }
}
