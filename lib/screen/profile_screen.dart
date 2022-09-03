import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/screen/signup_screen.dart';

import '../provider/MyProvider.dart';
import 'menu_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

TextEditingController passwordField = TextEditingController();
TextEditingController userNameField = TextEditingController();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 238, 134),
      appBar: AppBar(
        title: Text(
          'Назад',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MenuScreen(),
              ),
            );
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Form(
          key: key,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Здравейте,",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 94, 22),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${user!.displayName}",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 94, 22),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              userName(context),
              SizedBox(height: 40),
              password(context),
              SizedBox(height: 50),
              button(
                  name: "Запази",
                  function: () {
                    final bool? isValid = key.currentState?.validate();
                    if (userNameField.text.trim().isNotEmpty &&
                        isValid == true) {
                      setUserName(userNameField.text.trim());
                      userNameField = TextEditingController();
                    }
                    if (passwordField.text.trim().isNotEmpty) {
                      setPassword(passwordField.text.trim());
                      passwordField = TextEditingController();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

userName(buildContext) {
  var inputDecoration = InputDecoration(
    hintText: "Ново потребителско име",
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
            return 'Въведете потребителско име, за да го промените';
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

Future<void> setUserName(String displayName) async {
  final user = FirebaseAuth.instance.currentUser;
  await user?.updateDisplayName(displayName);
}

password(buildContext) {
  var inputDecoration = InputDecoration(
    hintText: "Нова парола",
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
            return 'Въведете парола, за да я промените';
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

Future<void> setPassword(String password) async {
  final user = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance.collection('userData').doc(user?.uid).set({
    "email": user?.email,
    "userid": user?.uid,
    "password": password.trim(),
  });
  user?.updatePassword(password.trim());
}

Widget button({
  @required name,
  @required function,
}) {
  return SizedBox(
    height: 50,
    width: 280,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 63, 53, 153)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      onPressed: function,
      child: Text(name,
          style: TextStyle(
            fontSize: 20,
            color: const Color.fromARGB(255, 240, 242, 245),
          )),
    ),
  );
}
