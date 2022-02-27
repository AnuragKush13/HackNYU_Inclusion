import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diverse_cuisine/recipe_description.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Enter_recipe extends StatefulWidget {
  const Enter_recipe({Key? key}) : super(key: key);

  @override
  _Enter_recipeState createState() => _Enter_recipeState();
}

class _Enter_recipeState extends State<Enter_recipe> {
  final _text = TextEditingController();
  String name = "";
  String culture = "";
  String recipe = "";
  String ingredients = "";
  String steps = "";
  bool _validate = false;
  void addToDatabase() {
    var recipeCollection = FirebaseFirestore.instance.collection('RECIPES');
    recipeCollection
      ..add({
        "name": name,
        "culture": culture,
        "recipe": recipe,
        "steps": steps,
        "ingredients": ingredients,
      });
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Description(
              culture: culture,
              ingredients: ingredients,
              name: name,
              recipe: recipe,
              steps: steps)),
    );
    // setState(() {
    //   name = "";
    //   culture = "";
    //   recipe = "";
    //   steps = " ";
    //   ingredients = "";
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Your recipe",
          style: GoogleFonts.alata(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              // Text_field(name, "Enter your name"),
              // Text_field(culture, "Enter your cultural background"),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange.shade50),
                padding: EdgeInsets.all(8),
                child: TextField(
                  // controller: _text,
                  autofocus: false,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: GoogleFonts.alata(
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      border: InputBorder.none),
                  style: GoogleFonts.alata(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange.shade50),
                padding: EdgeInsets.all(8),
                child: TextField(
                  // controller: _text,
                  autofocus: false,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                      hintText: "Enter your cultural background",
                      hintStyle: GoogleFonts.alata(
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      border: InputBorder.none),
                  style: GoogleFonts.alata(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    setState(() {
                      culture = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange.shade50),
                padding: EdgeInsets.all(8),
                child: TextField(
                  // controller: _text,
                  autofocus: false,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 2,
                  minLines: 1,
                  decoration: InputDecoration(
                      hintText: "Enter name of dish",
                      hintStyle: GoogleFonts.alata(
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      border: InputBorder.none),
                  style: GoogleFonts.alata(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    setState(() {
                      recipe = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange.shade50),
                padding: EdgeInsets.all(8),
                child: TextField(
                  // controller: _text,
                  autofocus: false,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 25,
                  minLines: 2,
                  decoration: InputDecoration(
                      hintText: "Ingredients",
                      hintStyle: GoogleFonts.alata(
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      border: InputBorder.none),
                  style: GoogleFonts.alata(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    setState(() {
                      ingredients = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange.shade50),
                padding: EdgeInsets.all(8),
                child: TextField(
                  // controller: _text,
                  autofocus: false,

                  textCapitalization: TextCapitalization.sentences,

                  maxLines: 55,
                  minLines: 10,
                  decoration: InputDecoration(
                      fillColor: Colors.orange,
                      hintText: "Steps to prepare this dish",
                      hintStyle: GoogleFonts.alata(
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      border: InputBorder.none),
                  style: GoogleFonts.alata(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    setState(() {
                      steps = value;
                    });
                  },
                ),
              ),
              _validate == true
                  ? Text("Complete all fields")
                  : SizedBox.shrink(),

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

                  // if (name == null ||
                  //     culture == null ||
                  //     recipe == null ||
                  //     ingredients == null ||
                  //     steps == null) {
                  //   setState(() {
                  //     _validate = true;
                  //   });
                  // } else {
                  //   setState(() {
                  //     _validate = false;
                  //   });
                  addToDatabase();
                },
                child: Text(
                  "Upload your recipe",
                  style: GoogleFonts.alata(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Text_field(String a, String hint) {
    return TextField(
      // controller: _text,
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.alata(
              color: Colors.black38, fontWeight: FontWeight.w500, fontSize: 18),
          border: InputBorder.none),
      style: GoogleFonts.alata(
          color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 18),
      textAlign: TextAlign.left,
      onChanged: (value) {
        setState(() {
          a = value;
        });
      },
    );
  }
}
