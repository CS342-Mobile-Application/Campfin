import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/trip_controller.dart';

// Model class to represent the trip data structure
class Trip {
  String title;
  String description;
  int maxParticipant;
  String campName;
  bool isPublic;
  DateTime startDate;
  DateTime endDate;

  Trip({
    required this.title,
    required this.description,
    required this.maxParticipant,
    required this.campName,
    required this.isPublic,
    required this.startDate,
    required this.endDate,
  });
}

class CreateTrip extends StatefulWidget {
  const CreateTrip({Key? key}) : super(key: key);

  @override
  _CreateTripState createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  String? selectedLocation;
  DateTime? startDate;
  DateTime? endDate;

  TripController tripController = Get.put(TripController());

  onInit() {
    tripController.fetchTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สร้างทริป'), // Change app bar title to Thai
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ชื่อทริป',
                        style: TextStyle(fontSize: 14)), // Change label to Thai
                    TextFormField(
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        hintText: 'ป้อนชื่อทริปของคุณ',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('คำอธิบาย',
                        style: TextStyle(fontSize: 14)), // Change label to Thai
                    TextFormField(
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        hintText: 'ป้อนคำอธิบายของคุณ',
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('จำนวนผู้เข้าร่วมสูงสุด',
                        style: TextStyle(fontSize: 14)), // Change label to Thai
                    TextFormField(
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        hintText: 'ป้อนจำนวนผู้เข้าร่วมสูงสุด',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
   SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('สถานที่',
                        style: TextStyle(fontSize: 14)), // Change label to Thai
                    DropdownButton<String>(
                      value: selectedLocation,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: const TextField().style,
                      dropdownColor: Colors
                          .white, // Set dropdown background color to white
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation = newValue;
                        });
                      },
                      items: [
                        const DropdownMenuItem<String>(
                          value: '',
                          child: Text(
                            'เลือกสถานที่', // Placeholder text
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey), // Placeholder text style
                          ),
                        ),
                        ...<String>['สถานที่ 1', 'สถานที่ 2', 'สถานที่ 3']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('วันที่เริ่มต้น',
                        style: TextStyle(fontSize: 14)), // Change label to Thai
                    TextButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (selectedDate != null) {
                          setState(() {
                            startDate = selectedDate;
                          });
                        }
                      },
                      child: Text(
                        startDate != null
                            ? startDate.toString()
                            : 'เลือกวันที่เริ่มต้น',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('วันที่สิ้นสุด',
                        style: TextStyle(fontSize: 14)), // Change label to Thai
                    TextButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (selectedDate != null) {
                          setState(() {
                            endDate = selectedDate;
                          });
                        }
                      },
                      child: Text(
                        endDate != null
                            ? endDate.toString()
                            : 'เลือกวันที่สิ้นสุด',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add your logic for creating the trip
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 80, 60, 60),
                  textStyle: const TextStyle(
                      fontSize: 16), // Set the font size of the button text
                  padding: const EdgeInsets.symmetric(
                      vertical: 12), // Set the padding of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Set the border radius of the button
                  ),
                ),
                child: const Text('สร้างทริป'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
