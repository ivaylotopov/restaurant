import 'package:flutter/material.dart';

class Format extends StatelessWidget {
  final String image;
  final String name;
  final double priceOfProduct;
  final VoidCallback onTap;
  Format(
      {required this.onTap,
      required this.image,
      required this.name,
      required this.priceOfProduct});
  @override
  Widget build(BuildContext buildContext) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 235,
        width: 210,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 113, 122, 128),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(image),
            ),
            ListTile(
              leading: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "${priceOfProduct.toStringAsFixed(2)} лв",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
