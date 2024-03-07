import 'package:flutter/material.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({Key? key}) : super(key: key);

  @override
  _PlaceDetailState createState() => _PlaceDetailState();
}


  

class _PlaceDetailState extends State<PlaceDetail> {

 


final List reviewData = [
  {
    'name': 'John Doe',
    'review': 'ทริปนี้เป็นทริปที่จะพาคุณไปเที่ยวที่อุทยานแห่งชาติเขาใหญ่ ที่จะมีกิจกรรมต่างๆ ที่คุณจะได้ร่วมสนุกกับเพื่อนๆ และได้เรียนรู้สิ่งใหม่ๆ อีกมากมาย',
    'rating': 4.5,
  },{
    'name': 'Jane Doe',
    'review': 'ทริปนี้เป็นทริปที่จะพาคุณไปเที่ยวที่อุทยานแห่งชาติเขาใหญ่ ที่จะมีกิจกรรมต่างๆ ที่คุณจะได้ร่วมสนุกกับเพื่อนๆ และได้เรียนรู้สิ่งใหม่ๆ อีกมากมาย',
    'rating': 4.5,
  },{
    'name': 'John Doe',
    'review': 'ทริปนี้เป็นทริปที่จะพาคุณไปเที่ยวที่อุทยานแห่งชาติเขาใหญ่ ที่จะมีกิจกรรมต่างๆ ที่คุณจะได้ร่วมสนุกกับเพื่อนๆ และได้เรียนรู้สิ่งใหม่ๆ อีกมากมาย',
    'rating': 4.5,
  }
];
    


    

    
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
        child: ListView(
          children:[ Column(
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
                      left: 16.0, right: 16.0, top: 12.0, bottom: 12.0),
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
                            child: const Icon(Icons.location_on),
                          ),
                          title: const Text('อุทยานแห่งชาติเขาใหญ่'),
                          subtitle: const Text('อ.เมือง จ.นครราชสีมา'),
                        ),
                        //auther
                        const SizedBox(height: 8),
                        const Text(
                          'ทริปนี้เป็นทริปที่จะพาคุณไปเที่ยวที่อุทยานแห่งชาติเขาใหญ่ ที่จะมีกิจกรรมต่างๆ ที่คุณจะได้ร่วมสนุกกับเพื่อนๆ และได้เรียนรู้สิ่งใหม่ๆ อีกมากมาย',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
          
                        const SizedBox(height: 10),
          
                        //review
                        const Text(
                          'รีวิว (10)',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        //review list reviewData
                        for (var review in reviewData)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color.fromARGB(255, 226, 226, 226),
                                    ),
                                    width: 32,
                                    height: 32,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/profileImage.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    review['name'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                review['review'],
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: <Widget>[
                                  for (var i = 0; i < 5; i++)
                                    Icon(
                                      Icons.star,
                                      color: i < review['rating']
                                          ? Colors.amber
                                          : Colors.grey,
                                      size: 16,
                                    ),
                                ],
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),

                          const SizedBox(height: 8),
                          const Text(
                            'เขียนรีวิว',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          const TextField(
                            decoration: InputDecoration(
                              hintText: 'เขียนรีวิว',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('ส่งรีวิว'),
                              ),
                            ],
                          ),
                      
                      ])),
            ],
          ),
          ]
        ),
      ),
    );
  }
}
