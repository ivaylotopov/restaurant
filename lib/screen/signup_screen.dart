// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/login_screen.dart';

GlobalKey<FormState> key = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

UserCredential? userCredential;
TextEditingController emailField = TextEditingController();
TextEditingController passwordField = TextEditingController();
TextEditingController userNameField = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  Future sendData() async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailField.text,
      password: passwordField.text,
    );
    await FirebaseFirestore.instance
        .collection('userData')
        .doc(userCredential?.user?.uid)
        .set({
      "email": emailField.text.trim(),
      "userid": userCredential?.user?.uid,
      "password": passwordField.text.trim(),
      "userName": userNameField.text.trim(),
    });
    setUserName(userNameField.text.trim());
  }

  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 238, 134),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              header(buildContext),
              userName(buildContext),
              email(buildContext),
              password(buildContext),
              ElevatedButton(
                onPressed: () async {
                  final bool? isValid = _formKey.currentState?.validate();
                  if (isValid == true) {
                    try {
                      await sendData().then((value) {
                        Navigator.push(
                            buildContext,
                            MaterialPageRoute(
                                builder: (buildContext) => LoginScreen()));
                        emailField = TextEditingController();
                        passwordField = TextEditingController();
                        userNameField = TextEditingController();
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Потребител с такъв имейл вече съществува!'),
                        ));
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 15)),
                child: Text("Създай акаунт", style: TextStyle(fontSize: 20)),
              ),
              accountCheck(buildContext)
            ],
          ),
        ),
      ),
    ));
  }
}

header(buildContext) {
  return Column(
    children: const [
      Text(
        "Регистрация",
        style: TextStyle(
          fontSize: 55,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 11, 94, 22),
        ),
      )
    ],
  );
}

email(buildContext) {
  var inputDecoration = InputDecoration(
    hintText: "Email",
    hintStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 18, 133, 43)),
    border: new OutlineInputBorder(
      borderSide: new BorderSide(
        color: Colors.white,
      ),
    ),
    filled: true,
    prefixIcon: Icon(
      Icons.email,
      color: Color.fromARGB(255, 18, 133, 43),
    ),
  );
  return Column(
    children: [
      TextFormField(
        controller: emailField,
        decoration: inputDecoration,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Моля въведете имейл адрес';
          }
          // Check if the entered email has the right format
          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return 'Моля въведе валиден имейл адрес';
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
    hintStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 18, 133, 43)),
    border: new OutlineInputBorder(
      borderSide: new BorderSide(
        color: Colors.white,
      ),
    ),
    filled: true,
    prefixIcon: Icon(
      Icons.lock,
      color: Color.fromARGB(255, 18, 133, 43),
    ),
  );
  return Column(
    children: [
      TextFormField(
        controller: passwordField,
        decoration: inputDecoration,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Моля въведете парола';
          }
          if (value.trim().length < 8) {
            return 'Паролата трябва да бъде с дължина поне 8 символа';
          }
          // Return null if the entered password is valid
          return null;
        },
        obscureText: true,
      ),
    ],
  );
}

userName(buildContext) {
  var inputDecoration = InputDecoration(
    hintText: "Username",
    hintStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 18, 133, 43)),
    border: new OutlineInputBorder(
      borderSide: new BorderSide(
        color: Colors.white,
      ),
    ),
    filled: true,
    prefixIcon: Icon(
      Icons.person,
      color: Color.fromARGB(255, 18, 133, 43),
    ),
  );
  return Column(
    children: [
      TextFormField(
        controller: userNameField,
        decoration: inputDecoration,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Моля въведете потребителско име';
          }
          // Check if the entered username has the right format
          if (!RegExp(r'^(?=[a-zA-Z0-9._]{3,20}$)(?!.*[_.]{2})[^_.].*[^_.]$')
              .hasMatch(value)) {
            return 'Моля въведе валидно потребителско име';
          }
          // Return null if the entered username is valid
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
      Text("Имаш акаунт? ",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          )),
      TextButton(
        onPressed: () {
          Navigator.push(
            buildcontext,
            MaterialPageRoute(builder: (buildcontext) => LoginScreen()),
          );
          emailField = TextEditingController();
          passwordField = TextEditingController();
          userNameField = TextEditingController();
        },
        child: Text(
          "Влез тук",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 7, 63, 109),
          ),
        ),
      )
    ],
  );
}

Future<void> setUserName(String displayName) async {
  final user = FirebaseAuth.instance.currentUser;
  await user?.updateDisplayName(displayName);
}
