import 'package:diverse_cuisine/recipes_list.dart';
import 'package:diverse_cuisine/enter_recipe.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Page(),
    );
  }
}

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Diverse Cuisine",
            style: TextStyle(fontSize: 25, color: Colors.black),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Enter_recipe()));
        },
        backgroundColor: Colors.orange.shade100,
        child: Text(
          "+",
          style: TextStyle(fontSize: 25, color: Colors.orange.shade500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.asset("assets/images/diverse_food.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Text(
              " Diversity in food then, can mean a few different things: For one, the representation of all cuisines and culture. Or, the array of nutrients needed for a full, well-rounded diet. Or, the variety of crops grown on a farm.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, height: 1.2),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.orange.shade100,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => Recipes_list()));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Recipes_list()),
              );
            },
            child: Text(
              "Explore other recipes",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade500),
            ),
          ),
        ],
      ),
    );
  }
}
