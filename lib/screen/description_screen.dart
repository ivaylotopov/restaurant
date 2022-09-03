import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/screen/cart_screen.dart';
import 'package:restaurant_app/screen/menu_screen.dart';
import 'package:restaurant_app/provider/MyProvider.dart';

class DescriptionScreen extends StatefulWidget {
  final String image;
  final double priceOfProduct;
  final String nameOfProduct;
  final String description;
  DescriptionScreen({
    required this.image,
    required this.nameOfProduct,
    required this.priceOfProduct,
    required this.description,
  });

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int quantity = 1;
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Назад',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuScreen()));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 222, 238, 134),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nameOfProduct,
                    style: TextStyle(
                      fontSize: 35,
                      color: Color.fromARGB(255, 2, 35, 63),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 35,
                            width: 50,
                            decoration: ShapeDecoration(
                              shape: StadiumBorder(
                                side: BorderSide(color: Colors.red),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$quantity',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 22, 8),
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                      Text(
                        "${(widget.priceOfProduct * quantity).toStringAsFixed(2)} лв",
                        style: TextStyle(
                            color: Color.fromARGB(255, 2, 35, 63),
                            fontSize: 30),
                      ),
                    ],
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                        color: Color.fromARGB(255, 2, 35, 63), fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.add(
                              image: widget.image,
                              name: widget.nameOfProduct,
                              price: widget.priceOfProduct,
                              quantity: quantity);

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 2, 35, 63),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Добави',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
