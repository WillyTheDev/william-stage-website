import 'package:exploracode/HomePage.dart';
import 'package:exploracode/competencePage.dart';
import 'package:exploracode/CreationPage.dart';
import 'package:exploracode/proposPage.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

String email = "email";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "William cherche un Stage 🔎",
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        HomePage.id:(context) => HomePage(),
        CompetencePage.id:(context) => CompetencePage(),
        CreationPage.id:(context) => CreationPage(),
        ProposPage.id:(context) => ProposPage(),
      },
      home: HomePage(),
    );
  }
}


