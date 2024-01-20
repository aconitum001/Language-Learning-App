// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:language_app/pages/colors.dart';
import 'package:language_app/pages/familymembers.dart';
import 'package:language_app/pages/numbers.dart';
import 'package:language_app/pages/phrases.dart';

void main() {
  runApp(TokuApp());
}

class TokuApp extends StatelessWidget {
  const TokuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/colors': (context) => ColorsPage(),
        '/familymembers': (context) => FamilyMembers(),
        '/numbers': (context) => NumbersPage(),
        '/phrases': (context) => Phrases(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF5DA),
      appBar: AppBar(
        leading: Icon(
          Icons.language,
          color: Colors.white,
        ),
        title: Text(
          "Toku",
          style: TextStyle(
            color: Color(0xFFF5EFE8),
          ),
        ),
        backgroundColor: Color(0xFF47312B),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Category(
            name: "Numbers",
            couleur: Color(0xffF09136),
            rail: '/numbers',
          ),
          Category(
            name: "Family Members",
            couleur: Color(0xff568A34),
            rail: '/familymembers',
          ),
          Category(
            name: "Colors",
            couleur: Color(0xff79339E),
            rail: '/colors',
          ),
          Category(
            name: "Phrases",
            couleur: Color(0xff4FADC8),
            rail: '/phrases',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  Category({this.name, this.couleur, this.rail, this.onTap});
  String? name;
  Color? couleur;
  String? rail;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: couleur,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, rail!);
        },
        child: Text(
          name!,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
