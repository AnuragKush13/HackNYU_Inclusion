import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String culture;
  final String ingredients;
  final String name;
  final String recipe;
  final String steps;
  const Description(
      {Key? key,
      @required this.culture = "C",
      @required this.ingredients = "I",
      @required this.name = "N",
      @required this.recipe = "R",
      @required this.steps = "S"})
      : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
            ),
            Center(child: Text(widget.name)),
            Text(widget.culture),
            Text(widget.recipe),
            Text(widget.ingredients),
            Text(widget.steps),
          ],
        ),
      ),
    );
  }
}
