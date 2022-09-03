import 'package:flutter/material.dart';
import 'package:restaurant_app/models/food_types.dart';
import 'package:restaurant_app/screen/description_screen.dart';
import 'package:restaurant_app/screen/menu_screen.dart';
import 'package:restaurant_app/screen/tools/format.dart';

class Types extends StatelessWidget {
  List<FoodType> collection = [];
  Types({required this.collection});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 238, 134),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Назад',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (page) => MenuScreen()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: collection
              .map((e) => Format(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => DescriptionScreen(
                              image: e.image,
                              nameOfProduct: e.name,
                              priceOfProduct: e.price,
                              description: e.description),
                        ),
                      );
                    },
                    image: e.image,
                    name: e.name,
                    priceOfProduct: e.price,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
