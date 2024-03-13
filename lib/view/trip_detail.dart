import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/trip_controller.dart';

class TripDetail extends StatefulWidget {


  const TripDetail({Key? key}) : super(key: key);
  



  @override
  _TripDetailState createState() => _TripDetailState();
}

class _TripDetailState extends State<TripDetail> {
    final TripController tripController = Get.put(TripController());
     final tripId = Get.rootDelegate.arguments()['id'];
     dynamic trip = {};
  
    @override
  void initState() {
    super.initState();
    if (tripId != null) {
      setTrip();
    }

  }

Future<void> setTrip() async {

  dynamic tempTrip = await tripController.getTripById(tripId);
  setState(() {
    trip = tempTrip;
  });

  }



  @override
  Widget build(BuildContext context) {
        if (trip.isEmpty) {
          //return skeleton
          return  Scaffold(
            appBar: AppBar(
              title: const Text('รายละเอียดทริป'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );

               



    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดทริป'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle,
                color: Colors.black, size: 40.0),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Container(
              decoration: const BoxDecoration(),
              clipBehavior: Clip.antiAlias, // Ensure content is clipped
              child: Image.network(
                trip['Place']['image'] ?? '',
                fit: BoxFit.cover,
              ),
            )),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 12.0, bottom: 12.0
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Text(
                        trip['title'] ?? '',
                        style:const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                   
               
                      ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 235, 235, 235),
                          ),
                          child: const Icon(Icons.calendar_today),
                        ),
                        title: const Text('14 December, 2021'),
                        subtitle: const Text('Tuesday, 4:00PM - 9:00PM'),
                      ),
                      ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 235, 235, 235),
                          ),
                          child: const Icon(Icons.location_on),
                        ),
                        title: Text(trip['Place']['name'] ?? ''),
                        subtitle: Text(trip['Place']['address'] ?? ''),
                      ),
                      //show map
                      const SizedBox(height: 8),
                      
                      //auther
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 235, 235, 235),
                          ),
                          clipBehavior:
                              Clip.antiAlias, 

                          child: Image.asset(
                            'assets/images/profileImage.png', 
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: const Text('Sarawut Inpol'),
                        subtitle: const Text('ผู้เชี่ยวชาญด้านการแคมป์ปิ้ง'),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 4, bottom: 4),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 80, 60, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text('ดูโปรไฟล์'),
                        ),
                 

                      ),
                      const SizedBox(height: 8),
                              Text(
                        trip['Place']['description'] ,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),

                      const SizedBox(height: 10),
                      SizedBox(
                        width: double
                            .infinity, // Ensure button takes up full width
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 80, 60, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text('เข้าร่วมทริป'),
                        ),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
