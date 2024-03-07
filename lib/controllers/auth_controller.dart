import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/state_manager.dart';

const String redirectUrl = "com.campfin.app";

class AuthController extends GetxController {
  var token = ''.obs;
  final FlutterSecureStorage _storage =const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    loadTokenFromStorage();
  }

  void loadTokenFromStorage() async {
    try {
      String? storedToken = await _storage.read(key: 'token');
      if (storedToken != null){
      setToken(storedToken);
      }
        } catch (e) {
      print("Error loading token from storage: $e");
    }
  }

  void setToken(String value) async {
    token.value = value;
    await _storage.write(key: 'token', value: value);
  }

  Future<void> loginWithGoogle() async {
    const authUrl = "https://asus.kittikun.me/auth/google";

    try {
      final result = await FlutterWebAuth.authenticate(
        url: authUrl,
        callbackUrlScheme: redirectUrl,
      );
      final tokenValue = Uri.parse(result).queryParameters['token'];
      if (tokenValue != null) {
        setToken(tokenValue);
      }
      print("Authentication Result: $tokenValue");
    } catch (e) {
      print("Error during authentication: $e");
    }
  }
}
