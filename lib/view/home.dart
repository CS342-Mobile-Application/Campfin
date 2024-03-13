import 'package:flutter/material.dart' hide NavigationBar;
import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/auth_controller.dart';
import 'package:mobile_campfin/view/profile.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campfin'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.account_circle,
                  color: Colors.black, size: 40.0),
              onPressed: () {
                Get.to(const Profile());
                      
              }),
              //logout
              IconButton(
              icon: const Icon(Icons.logout,
                  color: Colors.black, size: 40.0),
              onPressed: () {
                //alert dialog confirm logout
                Get.defaultDialog(
                  title: 'ออกจากระบบ',
                  middleText: 'คุณต้องการออกจากระบบใช่หรือไม่?',
                  textConfirm: 'ใช่',
                  textCancel: 'ไม่',
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    authController.removeToken();
                  },
                );
              }),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[ProfileCard(),
            
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const NavigationBar()
    );
    
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 226, 226, 226),
                    ),
                    padding: const EdgeInsets.all(8),
                    width: 54,
                    height: 54,
                    child: Image.asset(
                      'assets/images/campfinLogo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'หมายเลขชาวแคมป์ : 00000134',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'Sarawut Inpol',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'ผู้เชี่ยวชาญด้านการแคมป์ปิ้ง',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'เพศ : ชาย',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Text(
                      'เบอร์โทร : 081-234-5678',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Text(
                      'เข้าร่วมเมื่อ : 01/01/2021',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Text(
                      'สถานะ : สมาชิก',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Text(
                      'สาย : แคมป์เปอร์สายกิน',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 226, 226, 226),
                    ),
                    width: 92,
                    height: 92,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profileImage.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 226, 226, 226),
                    ),  
                    child: const Text(
                      'เบียร์',
                      style: TextStyle(fontSize: 12, color: Colors.black,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              color: Color.fromARGB(255, 241, 241, 241),
            ),
            child: Image.asset(
              'assets/images/barcode.png',
              width: 28,
              height: 120,
            ),
          ),
        ),
           Positioned(right: 92, bottom: 8, child:Column(
            children: <Widget>[
              Image.asset('assets/images/signature.png', width: 84, height: 24),
            const Text('ออกบัตรโดย campfin', style: TextStyle(fontSize: 12, color: Colors.black))
            ],
          ),  
        ),
    
      
      ],
    );
  }
}
