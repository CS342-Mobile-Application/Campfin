import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/auth_controller.dart';




class AuthService extends GetxService {
  final AuthController authController = Get.put(AuthController());

  
  bool isLoggedIn(BuildContext context) {
    print('authController.token.value: ${authController.getToken()}');

    if (authController.getToken() != '') {
      return true;
    }
    return false;
 
  }
}
