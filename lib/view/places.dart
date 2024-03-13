import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/place_controller.dart';
import 'package:mobile_campfin/view/place_detail.dart';

class Places extends StatefulWidget {
  const Places({Key? key}) : super(key: key);

  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  final PlaceController placeController = Get.put(PlaceController());

  onInit() {
    placeController.fetchPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สถานที่ท่องเที่ยว'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle,
                color: Colors.black, size: 40.0),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 241, 243, 245),
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
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 166, 166, 166),
                          fontWeight: FontWeight.normal,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
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
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const Row(
                      children: [
                        Text(
                          'สถานที่แนะนำ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          HighlightPlaceCard(),
                          SizedBox(width: 8),
                          HighlightPlaceCard(),
                          SizedBox(width: 8),
                          HighlightPlaceCard(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Text(
                          'สถานที่ทั้งหมด',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: placeController.placeList.length,
                        itemBuilder: (context, index) {
                          final place = placeController.placeList[index];
                          return PlaceCard(
                   place: place,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Map<String, dynamic> place;

  const PlaceCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          print('place id: $place');
              Get.rootDelegate.toNamed('/place-detail',
            arguments: {'id': place['name']});
      },
      child: Stack(
        children: [
          Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
                      ClipRect(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: place['image'] != null
                              ? Image.network(
                                  place['image'],
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/campfinLogo.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            Text(
                              place['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  place['address'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                Text(
                                  "4.5", // Here you can use the actual rating if available
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

class HighlightPlaceCard extends StatelessWidget {
  const HighlightPlaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const PlaceDetail());
      },
      child: Card(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1492648272180-61e45a8d98a7?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                width: 350,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'เขาใหญ่ จ.เชียงใหม่',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.orange,
                              size: 16,
                            ),
                            Text(
                              "อุทยานแห่งชาติเขาใหญ่",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
