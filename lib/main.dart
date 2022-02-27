import 'package:diverse_cuisine/recipes_list.dart';
import 'package:diverse_cuisine/enter_recipe.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

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
      // appBar: AppBar(
      //     centerTitle: true,
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     title: Text(
      //       "Diverse Cuisine",
      //       style: GoogleFonts.alata(
      //           fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
      //     )),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Enter_recipe()));
        },
        backgroundColor: Colors.orange.shade100,
        child: Text(
          "+",
          style: TextStyle(fontSize: 30, color: Colors.orange.shade500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            "Diverse Cuisine",
            style: GoogleFonts.alata(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 300,
            width: 300,
            child: Image.asset("assets/images/diverse_food.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Explore tradition through taste!",
              style: GoogleFonts.alata(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              "People from different cultural backgrounds eat different foods.Food is a window into our history. It shows the movement of people and food across time and place.\nThe more we honor cultural differences in eating, the healthier we will be.– Michael Pollan",
              textAlign: TextAlign.center,
              style: GoogleFonts.dancingScript(fontSize: 20, height: 1.5),
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
              "Explore recipes",
              style: GoogleFonts.alata(
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
