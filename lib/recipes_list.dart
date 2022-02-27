import 'package:diverse_cuisine/recipe_description.dart';
import 'package:diverse_cuisine/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

class Recipes_list extends StatefulWidget {
  const Recipes_list({Key? key}) : super(key: key);

  @override
  _Recipes_listState createState() => _Recipes_listState();
}

class _Recipes_listState extends State<Recipes_list> {
  var recipeCollection = FirebaseFirestore.instance.collection('RECIPES');
  List<recipe_model> r_list = [];
  bool hasdata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // getData() {
  //   CollectionReference cr = FirebaseFirestore.instance.collection("RECIPIES");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
          title: Text(
            "Recepies",
            style: GoogleFonts.alata(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.1,
            //   padding: EdgeInsets.only(top: 30, left: 15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       BackButton(),
            //       SizedBox(
            //         width: 15,
            //       ),
            //       Text(
            //         "Recepies",
            //         textAlign: TextAlign.left,
            //         style: GoogleFonts.alata(
            //             fontSize: 25,
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.88,
              child: StreamBuilder<QuerySnapshot>(
                stream: recipeCollection.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Description(
                                        culture: ds["culture"],
                                        ingredients: ds["ingredients"],
                                        name: ds["name"],
                                        recipe: ds["recipe"],
                                        steps: ds["steps"],
                                      )));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ds["recipe"],
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.alata(),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade200,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 8),
                                        child: Text(
                                          ds["culture"],
                                          style: GoogleFonts.alata(
                                              color: Colors.black),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Description(
                                                          culture:
                                                              ds["culture"],
                                                          ingredients:
                                                              ds["ingredients"],
                                                          name: ds["name"],
                                                          recipe: ds["recipe"],
                                                          steps: ds["steps"],
                                                        )));
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else
                    return Center(
                      child: Text(
                        "Loading recipies",
                        style: GoogleFonts.alata(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                },
              ),
            ),
          ],
        ));
  }
}
