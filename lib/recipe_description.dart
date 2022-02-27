import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            BackButton(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.recipe,
                style: GoogleFonts.alata(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange.shade50),
                padding: const EdgeInsets.all(12),
                child: Text(
                  widget.culture,
                  style: GoogleFonts.alata(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Ingredients",
                style: GoogleFonts.alata(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.ingredients,
                style: GoogleFonts.alata(
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Recipe steps",
                style: GoogleFonts.alata(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.steps,
                style: GoogleFonts.alata(
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.name,
                style: GoogleFonts.alata(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
