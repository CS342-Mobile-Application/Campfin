import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscured = true;

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
                          'Connect with people and plan  your next camp.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    )),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextField(
                    obscureText: _isObscured,
                    decoration: InputDecoration(
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
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 55),
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Text(
                //   'Or',
                //   style: Theme.of(context).textTheme.bodySmall,
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Row(children: <Widget>[
                    const Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 160, 160, 163),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("OR",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color.fromARGB(255, 160, 160, 163),
                            )),
                    const SizedBox(
                      width: 5,
                    ),
                    const Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 160, 160, 163),
                    )),
                  ]),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon:
                        Image.asset('assets/images/google-logo.png', width: 24),
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
                ),
              ],
            ),
            // const SizedBox(height: 50),
            //create account button
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
              child: ElevatedButton(
                onPressed: () {},
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
}
