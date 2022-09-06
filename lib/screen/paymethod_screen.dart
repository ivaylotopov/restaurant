import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/MyProvider.dart';
import 'package:restaurant_app/screen/cart_screen.dart';
import 'package:restaurant_app/screen/home_screen.dart';

import '../models/cart_settings.dart';
import '../models/food_types.dart';

class PayMethodScreen extends StatefulWidget {
  @override
  _PayMethodScreenState createState() => _PayMethodScreenState();
}

TextEditingController address = TextEditingController();
TextEditingController phoneNumber = TextEditingController();

class _PayMethodScreenState extends State<PayMethodScreen> {
  final key = GlobalKey<FormState>();

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);
    return Scaffold(
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
                builder: (context) => CartScreen(),
              ),
            );
            address = TextEditingController();
            phoneNumber = TextEditingController();
          },
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      addressForm(context),
                      SizedBox(height: 15),
                      phoneNumberForm(context),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
                height: 10,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Начин на плащане",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.orange)),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.only(right: 100.0),
                        child: Text(
                          "В брой при доставка",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.orange)),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio<int>(
                              value: 2,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value!;
                                });
                              }),
                          SizedBox(
                            width: 50,
                            child: Image.asset('folder1/visa.png'),
                          ),
                          Text(
                            "**** **** **** 1843",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 10,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Покупки: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "${(controller).totalPrice().toStringAsFixed(2)} лв.",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Доставка: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "3.00 лв.",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Общо: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "${((controller).totalPrice() + 3).toStringAsFixed(2)} лв.",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      color: const Color.fromARGB(255, 63, 53, 153),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () async {
                        if (key.currentState?.validate() == true) {
                          if (controller.cartCollection.isNotEmpty) {
                            Map<String, int> map = Map<String, int>();
                            for (var i = 0;
                                i < controller.cartCollection.length;
                                i++) {
                              final entry = <String, int>{
                                controller.cartCollection[i].name:
                                    controller.cartCollection[i].quantity
                              };
                              map.addEntries(entry.entries);
                            }
                            addCollection(
                                controller.totalPrice(),
                                address.text.trim(),
                                phoneNumber.text.trim(),
                                map);
                            controller.cartCollection = [];
                            controller.newCartCollection = [];
                            address = TextEditingController();
                            phoneNumber = TextEditingController();
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                isScrollControlled: true,
                                isDismissible: false,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 570,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(Icons.clear),
                                            )
                                          ],
                                        ),
                                        Image.asset('folder1/logo.png'),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Благодарим Ви!",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "Заповядайте отново!",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        }
                      },
                      child: Text("Поръчай",
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 240, 242, 245),
                          )),
                    ),
                  )
                ]),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

addressForm(buildContext) {
  var inputDecoration = InputDecoration(
      hintText: "Адрес за доставка",
      hintStyle:
          TextStyle(fontSize: 20, color: Color.fromARGB(255, 104, 14, 14)),
      border: new OutlineInputBorder(
        borderSide: new BorderSide(
          color: Color.fromARGB(255, 116, 33, 33),
        ),
      ),
      filled: true,
      prefixIcon: Icon(
        Icons.location_city,
        color: Color.fromARGB(255, 10, 2, 2),
      ));
  return Column(
    children: [
      TextFormField(
          controller: address,
          decoration: inputDecoration,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Полето е празно';
            }
          }),
    ],
  );
}

phoneNumberForm(buildContext) {
  var inputDecoration = InputDecoration(
      hintText: "Телефон",
      hintStyle:
          TextStyle(fontSize: 20, color: Color.fromARGB(255, 104, 14, 14)),
      border: new OutlineInputBorder(
        borderSide: new BorderSide(
          color: Color.fromARGB(255, 116, 33, 33),
        ),
      ),
      filled: true,
      prefixIcon: Icon(
        Icons.phone,
        color: Color.fromARGB(255, 10, 2, 2),
      ));
  return Column(
    children: [
      TextFormField(
          controller: phoneNumber,
          decoration: inputDecoration,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Полето е празно';
            }
          }),
    ],
  );
}

Future<void> addCollection(
    num total, String address, String number, Map map) async {
  CollectionReference users =
      FirebaseFirestore.instance.collection("Customers");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.add({
    'price': (total + 3).toStringAsFixed(2),
    'address': address,
    'phoneNumber': number,
    'order': map,
    'uid': uid
  });
  return;
}
