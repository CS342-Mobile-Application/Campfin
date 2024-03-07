// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:mobile_campfin/controllers/auth_controller.dart';
import 'package:mobile_campfin/data/client/dio_client.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authController = Get.put(AuthController());


  bool _isObscured = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final dio = DioClient().dio;
  final String redirectUrl = "com.campfin.app";

  Future<void> _loginWithGoogle() async {
    const authUrl =
        "https://asus.kittikun.me/auth/google";

    try {
      final result = await FlutterWebAuth.authenticate(
        url: authUrl,
        callbackUrlScheme: redirectUrl,
      );
      final token = Uri.parse(result).queryParameters['token'];

      print("Authentication Result: $token");
    } catch (e) {
      print("Error during authentication: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 177, 0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/campfinLogo.png',
                            width: 240),
                        const SizedBox(height: 5),
                        Text(
                          'CAMPFIN',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                letterSpacing: 5.0,
                              ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Connect with people and plan \n your next camp.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    )),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Column(children: [
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.red,
                                  ),
                          labelText: 'Username',
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: _isObscured,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.red,
                                  ),
                          labelText: 'Password',
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                            child: IconButton(
                              alignment: Alignment.center,
                              icon: Icon(
                                _isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Get.toNamed(page)
                            _signInWithUsernameAndPassword();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 55),
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                        child: Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Text(
                      //   'Or',
                      //   style: Theme.of(context).textTheme.bodySmall,
                      // ),
                      Row(children: <Widget>[
                        const Expanded(
                            child: Divider(
                          color: Color.fromARGB(255, 160, 160, 163),
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("OR",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      const Color.fromARGB(255, 160, 160, 163),
                                )),
                        const SizedBox(
                          width: 5,
                        ),
                        const Expanded(
                            child: Divider(
                          color: Color.fromARGB(255, 160, 160, 163),
                        )),
                      ]),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                           await authController.loginWithGoogle();
                        },  
                        icon: Image.asset('assets/images/google-logo.png',
                            width: 24),
                        label: const Text('Continue with Google'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 55),
                          side: const BorderSide(
                              color: Color.fromRGBO(62, 50, 50, 1)),
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 50),
            //create account button
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamed('/register');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  backgroundColor: const Color.fromARGB(255, 160, 160, 163),
                ),
                child: Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signInWithUsernameAndPassword() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    dio.post(
      "/auth/login",
      data: {
        "username": username,
        "password": password,
      },
    ).then((response) {
      print(response.data);
      // Get.toNamed('/home');
      Get.offNamed('/home');
      return true;
    }).catchError((error) {
      print(error);
      return false;
    });
  }
}
