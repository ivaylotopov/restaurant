import 'dart:ffi';

class CartSettings {
  final String image;
  final String name;
  final double price;
  final int quantity;

  CartSettings(
      {required this.image,
      required this.name,
      required this.price,
      required this.quantity});
}
