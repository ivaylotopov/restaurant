// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/login_screen.dart';
import 'package:restaurant_app/screen/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  Widget button({
    @required name,
    @required function,
  }) {
    return SizedBox(
      height: 50,
      width: 280,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 63, 53, 153)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)))),
        onPressed: function,
        child: Text(name,
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 240, 242, 245),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('folder1/logo.png'),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                    name: "Вход",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }),
                button(
                    name: "Регистрация",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
