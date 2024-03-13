import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/trip_controller.dart';
import 'package:mobile_campfin/view/create_trip.dart';
import 'package:mobile_campfin/view/profile.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  final TripController tripController = Get.put(TripController());
  


  onInit() {
    tripController.fetchTrips();
  }

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
                  const Text('10 ทริปกำลังเดินทาง',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/create-trip');
                      Get.to(const CreateTrip());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 10),
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
                child: Obx(() => 
                ListView.builder(
                    itemCount: tripController.tripList.length,
                    itemBuilder: (context, index) {
                      final trip = tripController.tripList[index];
                      return TripCard(trip: trip);
                    },
                  ),
            

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
  final Map<String, dynamic> trip;

  const TripCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //send trip id
        Get.rootDelegate.toNamed('/trip-detail',
            arguments: {'id': trip['id']});
            
      },
      child: Stack(
        children: [
          Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    buildPlaceImage(trip),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            Text(
                              trip['title'] ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 177, 0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'เข้าร่วมแล้ว ${trip['participants']?.length ?? 0} / ${trip['maxParticipant'] ?? 0} คน',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  trip['Place']['location'] ?? '',
                                  style: const TextStyle(
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


Widget buildPlaceImage(Map<String, dynamic> trip) {
  final imageUrl = trip['Place']['image'];
  return imageUrl != null
      ? Image.network(
          imageUrl,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/campfinLogo.png', // Change to your image path
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            );
          },
        )
      : Image.asset(
          'assets/images/campfinLogo.png', // Change to your image path
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        );
}
