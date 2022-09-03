import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/MyProvider.dart';
import 'package:restaurant_app/screen/menu_screen.dart';
import 'package:restaurant_app/screen/paymethod_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget product(
      {required String image,
      required String name,
      required double price,
      required VoidCallback function,
      required int quantity}) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${price.toStringAsFixed(2)} лв/бр.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "$quantity бр. = ${(price * quantity).toStringAsFixed(2)} лв",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: function,
            ),
          ],
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          children: [
            Text(
              " Общо: ",
              style: TextStyle(
                  color: Color.fromARGB(255, 122, 43, 43), fontSize: 30),
            ),
            Text(
              "${(controller.totalPrice()).toStringAsFixed(2)} лв",
              style: TextStyle(
                  color: Color.fromARGB(255, 94, 38, 38), fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => PayMethodScreen(),
                    ),
                  );
                },
                child: Text("Към плащане", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
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
      body: ListView.builder(
        itemCount: controller.cartCollection.length,
        itemBuilder: (e, index) {
          controller.getIndex(index);
          return product(
              function: () {
                controller.delete();
              },
              image: controller.cartCollection[index].image,
              name: controller.cartCollection[index].name,
              price: controller.cartCollection[index].price,
              quantity: controller.cartCollection[index].quantity);
        },
      ),
    );
  }
}
