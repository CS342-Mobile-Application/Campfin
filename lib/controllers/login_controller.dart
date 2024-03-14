import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/auth_controller.dart';
import 'package:mobile_campfin/data/client/dio_client.dart';

class LoginController extends GetxController {
  final DioClient dioClient = DioClient();
  AuthController authController = Get.find<AuthController>();


  Future<void> loginWithUsernameAndPassword(
      String username, String password) async {
    try {
      final data = {
        "username": username,
        "password": password,
      };
      final result = await dioClient.login(data);
      final tokenValue = result.data.accessToken;
      print('tokenValue: $result');
      if (tokenValue.isNotEmpty) {
        authController.setToken(tokenValue);
        Get.rootDelegate.offNamed('/home');
      }
      return;
    } catch (e) {
      print("Error during authentication: $e");
    }
  }
}
