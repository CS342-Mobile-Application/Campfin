// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/services/AuthService.dart';

class AuthMiddleware extends GetMiddleware {
  AuthService authService = Get.find<AuthService>();

  final List<String> ignoredRoutes = ['/public', '/ignore'];

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (ignoredRoutes.contains(route)) {
      return null;
    }
    bool isAuthenticated = authService.isLoggedIn();

    if (isAuthenticated &&
        (route.locationString == '/login' ||
            route.locationString == '/register')) {
      Get.rootDelegate.toNamed('/home');
      return null;
    }
    if (!isAuthenticated && route.locationString != '/login') {
      Get.rootDelegate.toNamed('/login');
      return null;
    }

    return await super.redirectDelegate(route);
  }
}
