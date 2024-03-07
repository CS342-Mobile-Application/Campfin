// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/services/AuthService.dart';

class AuthMiddleware extends GetMiddleware {

  //context
  final BuildContext context;

  AuthMiddleware(this.context);




  AuthService authService = Get.find<AuthService>();

  final List<String> ignoredRoutes = ['/public', '/ignore'];

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (ignoredRoutes.contains(route)) {
      return null;
    }
    bool isAuthenticated = authService.isLoggedIn(context);
    
    print('isAuthenticated: $isAuthenticated');

    if (isAuthenticated &&
        (route.locationString == '/login' ||
            route.locationString == '/register')) {
      Get.rootDelegate.toNamed('/home');
      return null;
    }

    if (!isAuthenticated &&
        (route.locationString == '/login' ||
            route.locationString == '/register')) {
      return await super.redirectDelegate(route);
    }

    if (!isAuthenticated) {
      Get.rootDelegate.toNamed('/login');
      return null;
    }

    return await super.redirectDelegate(route);
  }
}
