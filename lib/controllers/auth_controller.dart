
import 'package:get/get.dart';
import 'package:mobile_campfin/services/SecureStorageService.dart';

class AuthController extends GetxController{
  var token = ''.obs;

  final SecureStorageService _storage = SecureStorageService();

  @override
  void onInit() {
    super.onInit();
    loadTokenFromStorage();
  }

  String getToken() {
    return token.value;
  }

  void loadTokenFromStorage() async {
    try {
      String? storedToken = await _storage.read(key: 'token');
      if (storedToken != null) {
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

  void removeToken() async {
    token.value = '';
    await _storage.delete(key: 'token');
    Get.rootDelegate.offNamed('/login');
  }

}