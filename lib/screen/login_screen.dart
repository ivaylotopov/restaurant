// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/menu_screen.dart';
import 'package:restaurant_app/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

TextEditingController emailField = TextEditingController();
TextEditingController passwordField = TextEditingController();
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore store = FirebaseFirestore.instance;

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 222, 238, 134),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header(buildContext),
                email(buildContext),
                password(buildContext),
                ElevatedButton(
                  onPressed: () async {
                    final bool? isValid = key.currentState?.validate();
                    if (isValid == true) {
                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailField.text,
                                password: passwordField.text)
                            .then((value) {
                          Navigator.push(
                              buildContext,
                              MaterialPageRoute(
                                  builder: (buildContext) => MenuScreen()));
                          emailField = TextEditingController();
                          passwordField = TextEditingController();
                        });
                      } on FirebaseAuthException catch (error) {
                        if (error.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Потребител с такъв имейл не съществува!'),
                          ));
                        } else if (error.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Грешна парола!'),
                          ));
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(vertical: 15)),
                  child: Text("Влез", style: TextStyle(fontSize: 25)),
                ),
                accountCheck(buildContext)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

header(buildContext) {
  return Column(
    children: const [
      Text(
        "Вход",
        style: TextStyle(
            fontSize: 55,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 11, 94, 22)),
      )
    ],
  );
}

email(buildContext) {
  var inputDecoration = InputDecoration(
      hintText: "Email",
      hintStyle:
          TextStyle(fontSize: 20, color: Color.fromARGB(255, 18, 133, 43)),
      border: new OutlineInputBorder(
        borderSide: new BorderSide(
          color: Colors.white,
        ),
      ),
      filled: true,
      prefixIcon: Icon(
        Icons.email,
        color: Color.fromARGB(255, 18, 133, 43),
      ));
  return Column(
    children: [
      TextFormField(
        controller: emailField,
        decoration: inputDecoration,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Полето е празно';
          }
          // Check if the entered email has the right format
          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return 'Моля въведете валиден имейл адрес';
          }
          // Return null if the entered email is valid
          return null;
        },
      ),
    ],
  );
}

password(buildContext) {
  var inputDecoration = InputDecoration(
      hintText: "Password",
      hintStyle:
          TextStyle(fontSize: 20, color: Color.fromARGB(255, 18, 133, 43)),
      border: new OutlineInputBorder(
        borderSide: new BorderSide(
          color: Colors.white,
        ),
      ),
      filled: true,
      prefixIcon: Icon(
        Icons.lock,
        color: Color.fromARGB(255, 18, 133, 43),
      ));
  return Column(
    children: [
      TextFormField(
        controller: passwordField,
        decoration: inputDecoration,
        obscureText: true,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Полето е празно';
          }
          return null;
        },
      ),
    ],
  );
}

accountCheck(buildcontext) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Нямаш акаунт? ",
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
      TextButton(
          onPressed: () {
            Navigator.push(
              buildcontext,
              MaterialPageRoute(builder: (buildcontext) => SignUpScreen()),
            );
            emailField = TextEditingController();
            passwordField = TextEditingController();
          },
          child: Text("Създай тук",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 7, 63, 109),
              )))
    ],
  );
}
