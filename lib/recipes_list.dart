import 'package:diverse_cuisine/recipe_description.dart';
import 'package:diverse_cuisine/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

class Recipes_list extends StatefulWidget {
  const Recipes_list({Key? key}) : super(key: key);

  @override
  _Recipes_listState createState() => _Recipes_listState();
}

class _Recipes_listState extends State<Recipes_list> {
  var recipeCollection = FirebaseFirestore.instance.collection('RECIPES');
  List<recipe_model> r_list = [];

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
        body: Container(
      margin: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      // child: Text("working"),
      child: StreamBuilder<QuerySnapshot>(
        stream: recipeCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
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
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ds["recipe"],
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(children: [ Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Text(ds["culture"]),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ))],),
                         
                        ],
                      ),
                    ),
                  );
                });
          else
            return Container(
              child: Center(
                child: Text("No Recipes"),
              ),
            );
        },
      ),
    ));
  }
}
