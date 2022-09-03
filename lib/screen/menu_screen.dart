import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/categories.dart';
import 'package:restaurant_app/models/food_types.dart';
import 'package:restaurant_app/models/foods.dart';
import 'package:restaurant_app/provider/MyProvider.dart';
import 'package:restaurant_app/screen/cart_screen.dart';
import 'package:restaurant_app/screen/description_screen.dart';
import 'package:restaurant_app/screen/home_screen.dart';
import 'package:restaurant_app/screen/profile_screen.dart';
import 'package:restaurant_app/screen/tools/format.dart';
import 'package:restaurant_app/screen/types.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Categories> burgers = [];
  List<Categories> pizzas = [];
  List<Categories> soups = [];
  List<Categories> drinks = [];
  List<Categories> desserts = [];
  List<Categories> salads = [];
  List<Food> luncheMenu = [];
  List<FoodType> burgerCollection = [];
  List<FoodType> pizzaCollection = [];
  List<FoodType> drinkCollection = [];
  List<FoodType> soupCollection = [];
  List<FoodType> dessertCollection = [];
  List<FoodType> saladCollection = [];

  Widget categories(
      {required VoidCallback onTap,
      required String image,
      required String nameOfProduct}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            nameOfProduct,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 11, 45, 73)),
          ),
        )
      ],
    );
  }

  Widget section(
      {required String name,
      required IconData iconData,
      required double distance}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(right: distance),
        child: Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget sectionButton(
      {required String name,
      required IconData iconData,
      required BuildContext buildContext,
      required Widget screen}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      title: TextButton(
        child: Padding(
          padding: const EdgeInsets.only(right: 120),
          child: Text(
            name,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onPressed: () {
          Navigator.push(
            buildContext,
            MaterialPageRoute(builder: (buildcontext) => screen),
          );
        },
      ),
    );
  }

  Widget addressButton(
      {required String name,
      required IconData iconData,
      required BuildContext buildContext}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      title: TextButton(
        child: Padding(
          padding: const EdgeInsets.only(right: 45),
          child: Text(
            name,
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              isScrollControlled: true,
              isDismissible: false,
              context: context,
              builder: (context) {
                return Container(
                  color: Color.fromARGB(255, 240, 204, 204),
                  height: 570,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.clear),
                          )
                        ],
                      ),
                      Image.asset('folder1/location.png'),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }

  Widget burger() {
    return Row(
      children: burgers
          .map((e) => categories(
                image: e.image,
                nameOfProduct: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Types(
                        collection: burgerCollection,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Widget pizza() {
    return Row(
      children: pizzas
          .map((e) => categories(
                image: e.image,
                nameOfProduct: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Types(collection: pizzaCollection),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Widget soup() {
    return Row(
      children: soups
          .map((e) => categories(
                image: e.image,
                nameOfProduct: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Types(collection: soupCollection),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Widget drink() {
    return Row(
      children: drinks
          .map((e) => categories(
                image: e.image,
                nameOfProduct: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Types(collection: drinkCollection),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Widget dessert() {
    return Row(
      children: desserts
          .map((e) => categories(
                image: e.image,
                nameOfProduct: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          Types(collection: dessertCollection),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  Widget salad() {
    return Row(
      children: salads
          .map((e) => categories(
                image: e.image,
                nameOfProduct: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Types(collection: saladCollection),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);
    controller.getBurger();
    burgers = controller.BurgersList;
    controller.getPizza();
    pizzas = controller.PizzaList;
    controller.getSoups();
    soups = controller.SoupsList;
    controller.getDrinks();
    drinks = controller.DrinksList;
    controller.getDesserts();
    desserts = controller.DessertsList;
    controller.getSalads();
    salads = controller.SaladsList;
    controller.getFoodCollection();
    luncheMenu = controller.FoodList;
    controller.getBurgerType();
    burgerCollection = controller.BurgerType;
    controller.getPizzaType();
    pizzaCollection = controller.PizzaType;
    controller.getDrinkType();
    drinkCollection = controller.DrinkType;
    controller.getSoupType();
    soupCollection = controller.SoupType;
    controller.getDessertType();
    dessertCollection = controller.DessertType;
    controller.getSaladType();
    saladCollection = controller.SaladType;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 245, 143, 26),
        child: SafeArea(
          child: Column(
            children: [
              sectionButton(
                  name: "Профил",
                  iconData: Icons.person,
                  buildContext: context,
                  screen: ProfileScreen()),
              sectionButton(
                  name: "Количка",
                  iconData: Icons.shopping_cart,
                  buildContext: context,
                  screen: CartScreen()),
              ListTile(
                leading: Text(
                  "Контакти",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              section(
                  name: "+359 888 458 245",
                  iconData: Icons.phone,
                  distance: 8.0),
              section(
                  name: "grand.rest@mail.com",
                  iconData: Icons.email,
                  distance: 8.0),
              addressButton(
                  name: "ул. Белимел, ж.к Студентски град",
                  iconData: Icons.location_pin,
                  buildContext: context),
              sectionButton(
                  name: "Изход",
                  iconData: Icons.exit_to_app,
                  buildContext: context,
                  screen: HomeScreen()),
              Image.asset('folder1/chef.jpg')
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 222, 238, 134),
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Меню GRAND"),
        backgroundColor: Colors.blue[350],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                burger(),
                pizza(),
                soup(),
                drink(),
                dessert(),
                salad(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Обедно меню",
                  style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 18, 133, 43),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 470,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: luncheMenu
                    .map((e) => Format(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => DescriptionScreen(
                                  image: e.image,
                                  nameOfProduct: e.name,
                                  priceOfProduct: e.price,
                                  description: e.description,
                                ),
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
          ),
        ],
      ),
    );
  }
}
