import 'package:flutter/material.dart';

class TripDetail extends StatefulWidget {
  const TripDetail({Key? key}) : super(key: key);

  @override
  _TripDetailState createState() => _TripDetailState();
}

class _TripDetailState extends State<TripDetail> {
  @override
  Widget build(BuildContext context) {
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
                'https://images.unsplash.com/photo-1525811902-f2342640856e?q=80&w=3542&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                      const Text(
                        'กางเต้นท์ชมวิวเขาใหญ่',
                        style: TextStyle(
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
                        title: const Text('อุทยานแห่งชาติเขาใหญ่'),
                        subtitle: const Text('อ.เมือง จ.นครราชสีมา'),
                      ),
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
                             const Text(
                        'ทริปนี้เป็นทริปที่จะพาคุณไปเที่ยวที่อุทยานแห่งชาติเขาใหญ่ ที่จะมีกิจกรรมต่างๆ ที่คุณจะได้ร่วมสนุกกับเพื่อนๆ และได้เรียนรู้สิ่งใหม่ๆ อีกมากมาย',
                        style: TextStyle(fontSize: 16, color: Colors.black),
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
