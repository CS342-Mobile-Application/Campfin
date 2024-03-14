import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/auth_controller.dart';

const String redirectUrl = "com.campfin.app";

class GoogleController extends GetxController {
  AuthController authController = Get.find<AuthController>();


  Future<void> loginWithGoogle() async {
    const authUrl = "https://asus.kittikun.me/auth/google";

    try {
      final result = await FlutterWebAuth.authenticate(
        url: authUrl,
        callbackUrlScheme: redirectUrl,
      );
      final tokenValue = Uri.parse(result).queryParameters['token'];
      if (tokenValue != null) {
        authController.setToken(tokenValue);
        Get.rootDelegate.offNamed('/home');
      }
    } catch (e) {
      print("Error during authentication: $e");
    }
  }
}
