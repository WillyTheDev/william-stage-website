import 'dart:ui';

import 'package:exploracode/HomePage.dart';
import 'package:exploracode/CreationPage.dart';
import 'package:exploracode/proposPage.dart';
import 'package:flutter/material.dart';

import '../competencePage.dart';


class NavBar extends StatefulWidget {
  NavBar({this.scrollController});
  final ScrollController scrollController;
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool navBarIsHover = false;
  bool menuIsOpen = false;
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    bool mediumView = data.size.width <= 1600;
    bool smallView = data.size.width <= 1024;
    double textSize =  mediumView ? data.size.width / 60 : data.size.width / 80;
    return !smallView ? MouseRegion(
      onEnter: (pointer) {
        setState(() {
          navBarIsHover = true;
        });
      },
      onExit: (pointer) {
        setState(() {
          navBarIsHover = false;
        });
      },
      child: Container(
        width: data.size.width,
        height: data.size.height / 10,
        child: Align(
          alignment: Alignment.topCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 700),
            curve: Curves.easeOut,
            width: data.size.width,
            decoration: BoxDecoration(
                color: Colors.transparent,
              boxShadow: [
                BoxShadow(color: Colors.transparent, blurRadius: 30.0)
              ]
            ),

            height: !navBarIsHover && widget.scrollController.offset.round() != 0 ? 0 : data.size.height / 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(onPressed: () {
                    Navigator.pushNamed(context, HomePage.id);
                  }, child: Text("Acceuil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: textSize),)),
                  FlatButton(onPressed: () {
                    Navigator.pushNamed(context, CompetencePage.id);
                  }, child: Text("Compétences", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: textSize),)),
                  FlatButton(onPressed: () {
                    Navigator.pushNamed(context, CreationPage.id);
                  }, child: Text("Créations", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: textSize),)),
                  FlatButton(onPressed: () {
                    Navigator.pushNamed(context, ProposPage.id);
                  }, child: Text("À propos de moi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: textSize),)),
                ],
              ),
            ),
          ),
        ),
      ),
    ) : Stack(
      children: <Widget>[
        AnimatedContainer(
          color: Color(0xFF06060F),
          width: data.size.width,
          height: menuIsOpen ? data.size.height / null : 0,
          duration: Duration(milliseconds: 1300),
          curve: Curves.bounceOut,
          child: Column(
            children: [
              SizedBox(height: data.size.height / 8,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, HomePage.id);
                  },
                  child: Text("Acceuil",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: data.size.width / 25,
                      )),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, CompetencePage.id);
                  },
                  child: Text("Compétences",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: data.size.width / 25,
                      )),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed:(){
                    Navigator.pushNamed(context, CreationPage.id);
                  },
                  child: Text("Mes créations",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: data.size.width / 25,
                      )),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, ProposPage.id);
                  },
                  child: Text(
                    "À propos de moi",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: data.size.width / 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            if (menuIsOpen) {
              setState(() {
                menuIsOpen = false;
              });
            } else {
              setState(() {
                menuIsOpen = true;
              });
            }
          },
          icon: !menuIsOpen ? Icon(Icons.dehaze) : Icon(Icons.clear),
          color: Colors.white,
          iconSize: data.size.width / 15,
        ),
      ],
    );;
  }
}
