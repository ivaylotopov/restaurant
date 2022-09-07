import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/models/cart_settings.dart';
import 'package:restaurant_app/models/categories.dart';
import 'package:restaurant_app/models/food_types.dart';
import 'package:restaurant_app/models/foods.dart';

class Controller extends ChangeNotifier {
  List<Categories> burgersList = [];
  late Categories burgerCategory;
  Future<void> getBurger() async {
    List<Categories> newBurgerCategory = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('eTqIGQVPCGDDdQbGdXat')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategory = Categories(
        image: element['image'],
        name: element['name'],
      );
      newBurgerCategory.add(burgerCategory);
      burgersList = newBurgerCategory;
    });
    notifyListeners();
  }

  get BurgersList {
    return burgersList;
  }

  List<Categories> pizzasList = [];
  late Categories pizzaCategory;
  Future<void> getPizza() async {
    List<Categories> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('eTqIGQVPCGDDdQbGdXat')
        .collection('pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategory = Categories(
        image: element['image'],
        name: element['name'],
      );
      newPizzaList.add(pizzaCategory);
      pizzasList = newPizzaList;
    });
    notifyListeners();
  }

  get PizzaList {
    return pizzasList;
  }

  List<Categories> soupsCollection = [];
  late Categories soupCategory;
  Future<void> getSoups() async {
    List<Categories> newSoupCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('eTqIGQVPCGDDdQbGdXat')
        .collection('soups')
        .get();
    querySnapshot.docs.forEach((element) {
      soupCategory = Categories(
        image: element['image'],
        name: element['name'],
      );
      newSoupCollection.add(soupCategory);
      soupsCollection = newSoupCollection;
    });
    notifyListeners();
  }

  get SoupsList {
    return soupsCollection;
  }

  List<Categories> drinksCollection = [];
  late Categories drinkCategory;
  Future<void> getDrinks() async {
    List<Categories> newDrinkCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('eTqIGQVPCGDDdQbGdXat')
        .collection('drinks')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkCategory = Categories(
        image: element['image'],
        name: element['name'],
      );
      newDrinkCollection.add(drinkCategory);
      drinksCollection = newDrinkCollection;
    });
    notifyListeners();
  }

  get DrinksList {
    return drinksCollection;
  }

  List<Categories> dessertsCollection = [];
  late Categories dessertCategory;
  Future<void> getDesserts() async {
    List<Categories> newDessertCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('eTqIGQVPCGDDdQbGdXat')
        .collection('desserts')
        .get();
    querySnapshot.docs.forEach((element) {
      dessertCategory = Categories(
        image: element['image'],
        name: element['name'],
      );
      newDessertCollection.add(dessertCategory);
      dessertsCollection = newDessertCollection;
    });
    notifyListeners();
  }

  get DessertsList {
    return dessertsCollection;
  }

  List<Categories> saladsCollection = [];
  late Categories saladCategory;
  Future<void> getSalads() async {
    List<Categories> newSaladCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('eTqIGQVPCGDDdQbGdXat')
        .collection('salads')
        .get();
    querySnapshot.docs.forEach((element) {
      saladCategory = Categories(
        image: element['image'],
        name: element['name'],
      );
      newSaladCollection.add(saladCategory);
      saladsCollection = newSaladCollection;
    });
    notifyListeners();
  }

  get SaladsList {
    return saladsCollection;
  }

  List<Food> foodCollection = [];
  late Food food;
  Future<void> getFoodCollection() async {
    List<Food> newFoodCollection = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('types').get();
    querySnapshot.docs.forEach((element) {
      food = Food(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        description: element['description'],
      );
      newFoodCollection.add(food);
    });
    foodCollection = newFoodCollection;
    notifyListeners();
  }

  get FoodList {
    return foodCollection;
  }

  List<FoodType> burgerCollection = [];
  late FoodType burgerType;
  Future<void> getBurgerType() async {
    List<FoodType> newBurgerCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foods')
        .doc('Bzh7CrzKFahT3GhGuHYf')
        .collection('burgers')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerType = FoodType(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        description: element['description'],
      );
      newBurgerCollection.add(burgerType);
      burgerCollection = newBurgerCollection;
    });
  }

  get BurgerType {
    return burgerCollection;
  }

  List<FoodType> pizzaCollection = [];
  late FoodType pizzaType;
  Future<void> getPizzaType() async {
    List<FoodType> newPizzaCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foods')
        .doc('Bzh7CrzKFahT3GhGuHYf')
        .collection('pizzas')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaType = FoodType(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        description: element['description'],
      );
      newPizzaCollection.add(pizzaType);
      pizzaCollection = newPizzaCollection;
    });
  }

  get PizzaType {
    return pizzaCollection;
  }

  List<FoodType> drinkCollection = [];
  late FoodType drinkType;
  Future<void> getDrinkType() async {
    List<FoodType> newDrinkCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foods')
        .doc('Bzh7CrzKFahT3GhGuHYf')
        .collection('drinks')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkType = FoodType(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        description: element['description'],
      );
      newDrinkCollection.add(drinkType);
      drinkCollection = newDrinkCollection;
    });
  }

  get DrinkType {
    return drinkCollection;
  }

  List<FoodType> soupCollection = [];
  late FoodType soupType;
  Future<void> getSoupType() async {
    List<FoodType> newSoupCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foods')
        .doc('Bzh7CrzKFahT3GhGuHYf')
        .collection('soups')
        .get();
    querySnapshot.docs.forEach((element) {
      soupType = FoodType(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        description: element['description'],
      );
      newSoupCollection.add(soupType);
      soupCollection = newSoupCollection;
    });
  }

  get SoupType {
    return soupCollection;
  }

  List<FoodType> dessertCollection = [];
  late FoodType dessertType;
  Future<void> getDessertType() async {
    List<FoodType> newDessertCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foods')
        .doc('Bzh7CrzKFahT3GhGuHYf')
        .collection('desserts')
        .get();
    querySnapshot.docs.forEach((element) {
      dessertType = FoodType(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        description: element['description'],
      );
      newDessertCollection.add(dessertType);
      dessertCollection = newDessertCollection;
    });
  }

  get DessertType {
    return dessertCollection;
  }

  List<FoodType> saladCollection = [];
  late FoodType saladType;
  Future<void> getSaladType() async {
    List<FoodType> newSaladCollection = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foods')
        .doc('Bzh7CrzKFahT3GhGuHYf')
        .collection('salads')
        .get();
    querySnapshot.docs.forEach((element) {
      saladType = FoodType(
        image: element['image'],
        name: element['name'],
        price: element['price'],
        description: element['description'],
      );
      newSaladCollection.add(saladType);
      saladCollection = newSaladCollection;
    });
  }

  get SaladType {
    return saladCollection;
  }

  List<CartSettings> cartCollection = [];
  List<CartSettings> newCartCollection = [];
  late CartSettings cartSettings;

  void add(
      {required String image,
      required String name,
      required double price,
      required int quantity}) {
    cartSettings = CartSettings(
        image: image, name: name, price: price, quantity: quantity);
    newCartCollection.add(cartSettings);
    cartCollection = newCartCollection;
  }

  get CartCollection {
    return cartCollection;
  }

  double totalPrice() {
    double price = 0;
    cartCollection.forEach((element) {
      price += element.price * element.quantity;
    });
    return price;
  }
}
