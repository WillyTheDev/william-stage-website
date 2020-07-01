import 'dart:io';

import 'package:exploracode/chat.dart';
import 'package:exploracode/competencePage.dart';
import 'package:exploracode/CreationPage.dart';
import 'package:exploracode/components/bottomBar.dart';
import 'package:exploracode/components/navigation.dart';
import 'package:exploracode/proposPage.dart';
import 'package:flutter/material.dart';


import 'components/uiWidget.dart';

class HomePage extends StatefulWidget {
  static String id ="HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  bool showChat = false;
  double lastScrollPosition = 2.0;
  ScrollController homeScrollController = ScrollController();


  @override
  void initState() {
    homeScrollController.addListener(()async {
     await Future.delayed(Duration(milliseconds: 100 ));
     lastScrollPosition = homeScrollController.offset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    bool mediumView = data.size.width <= 1048;
    bool smallView = data.size.width <= 600;
    double titleSize = smallView
        ? data.size.width / 15
        : mediumView ? data.size.width / 15 : data.size.width / 20;
    double subTitleSize = smallView
        ? data.size.width / 25
        : mediumView ? data.size.width / 30 : data.size.width / 40;
    double text1Size = smallView
        ? data.size.width / 20
        : mediumView ? data.size.width / 30 : data.size.width / 40;
    double text2Size = smallView
        ? data.size.width / 30
        : mediumView ? data.size.width / 40 : data.size.width / 60;
    print("${data.size.width},${data.size.height}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF06060F),
      body: NotificationListener(
        onNotification: (v){
          if(v is ScrollUpdateNotification){
            if(lastScrollPosition != homeScrollController.offset) {
              setState(() {
                rateThree -= v.scrollDelta / 1;
                rateTwo -= v.scrollDelta / 1.5;
                rateOne -= v.scrollDelta / 3;
                rateZero -= v.scrollDelta / 4;
              });
            }
          }
          return true;
        },
        child: Stack(
          children: [
            ParallaxWidget(asset: "parallax3", top: rateZero),
            ParallaxWidget(asset: "parallax2", top: rateOne),
          Positioned(
            left: -10,
            top: rateOne,
            child: Container(
              height: data.size.height / 1.2,
              width: data.size.width * 1.01,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WILLIAM SCHOLDER", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w900, fontSize: titleSize, color: Colors.white),),
                  Text("CHERCHE UN STAGE", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: subTitleSize, color: Colors.white),)
                ],
              ),
            ),
          ),
            ParallaxWidget(asset: "parallax1", top: rateTwo),
            ParallaxWidget(asset: "parallax0", top: rateThree),
            ListView(
              controller: homeScrollController,
              children: [
                SizedBox(
                  height: data.size.height * 1.08,
                  width: data.size.width,
                ),
                Container(
                  color: Color(0xFF171831),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: data.size.height / 8,),
                        Container(
                          child: smallView ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset("assets/bag.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(width: data.size.width / 2.5,child: Column(
                                      children: [
                                        Text("Il est temps pour moi de prendre mon envol.", style: TextStyle(color: Colors.white, fontSize: text1Size, fontWeight: FontWeight.w700),),
                                        Text("Après avoir acquis une certaine connaissance, j'ai besoin d'apprendre à les mettre à profit dans une équipe.", style: TextStyle(color: Colors.grey, fontSize: text2Size, fontWeight: FontWeight.w400),),
                                      ],
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Material(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        color: Colors.transparent,
                                        child: InkWell(
                                          hoverColor: Colors.black38,
                                          onTap: (){
                                            Navigator.pushNamed(context, CompetencePage.id);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(width: 4.0, color: Color(0xFFF7B13A))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0,),
                                              child: Text("Découvrir mes compétences", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: text2Size),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ):Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset("assets/bag.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(width: data.size.width / 2.5,child: Column(
                                      children: [
                                        Text("Il est temps pour moi de prendre mon envol.", style: TextStyle(color: Colors.white, fontSize: text1Size, fontWeight: FontWeight.w700),),
                                        Text("Après avoir acquis une certaine connaissance, j'ai besoin d'apprendre à les mettre à profit dans une équipe.", style: TextStyle(color: Colors.grey, fontSize: text2Size, fontWeight: FontWeight.w400),),
                                      ],
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Material(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        color: Colors.transparent,
                                        child: InkWell(
                                          hoverColor: Colors.black38,
                                          onTap: (){
                                              Navigator.pushNamed(context, CompetencePage.id);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(width: 4.0, color: Color(0xFFF7B13A))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0,),
                                              child: Text("Découvrir mes compétences", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: text2Size),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: data.size.height / 8,),
                        Container(
                          child: smallView? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(width: data.size.width / 2.5,child: Column(
                                      children: [
                                        Text("Les créations dont je suis le plus fiers.", style: TextStyle(color: Colors.white, fontSize: text1Size, fontWeight: FontWeight.w700),),
                                        Text("Ce chemin, je ne l'aurais pas parcouru sans rien accomplir, tous mes projets on été réalisé par moi de A à Z.", style: TextStyle(color: Colors.grey, fontSize: text2Size, fontWeight: FontWeight.w400),),
                                      ],
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Material(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        color: Colors.transparent,
                                        child: InkWell(
                                          hoverColor: Colors.black38,
                                          onTap: (){
                                            Navigator.pushNamed(context, CreationPage.id);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(width: 4.0, color: Color(0xFFF7B13A))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0,),
                                              child: Text("Découvrir mes créations", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: text2Size),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Image.asset("assets/plant.png"),
                              ),
                            ],
                          ):Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(width: data.size.width / 2.5,child: Column(
                                      children: [
                                        Text("Les créations dont je suis le plus fiers.", style: TextStyle(color: Colors.white, fontSize: text1Size, fontWeight: FontWeight.w700),),
                                        Text("Ce chemin, je ne l'aurais pas parcouru sans rien accomplir, tous mes projets on été réalisé par moi de A à Z.", style: TextStyle(color: Colors.grey, fontSize: text2Size, fontWeight: FontWeight.w400),),
                                      ],
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Material(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        color: Colors.transparent,
                                        child: InkWell(
                                          hoverColor: Colors.black38,
                                          onTap: (){
                                              Navigator.pushNamed(context, CreationPage.id);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(width: 4.0, color: Color(0xFFF7B13A))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0,),
                                              child: Text("Découvrir mes créations", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: text2Size),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Image.asset("assets/plant.png"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: data.size.height / 8,),
                        Container(
                          child: smallView ?Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: data.size.height / 2.5,
                                child: Image.asset("assets/propos.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(width: data.size.width / 2.5,child: Column(
                                      children: [
                                        Text("Je suis un homme simple, mais passionné", style: TextStyle(color: Colors.white, fontSize: text1Size, fontWeight: FontWeight.w700),),
                                        Text("Quand j'étais petit j'expliquais à ma mère que je ne voulais pas mélanger hobbies et Travail, heureusement que j'ai grandi...", style: TextStyle(color: Colors.grey, fontSize: text2Size, fontWeight: FontWeight.w400),),
                                      ],
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Material(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        color: Colors.transparent,
                                        child: InkWell(
                                          hoverColor: Colors.black38,
                                          onTap: (){
                                            Navigator.pushNamed(context, ProposPage.id);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(width: 4.0, color: Color(0xFFF7B13A))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0,),
                                              child: Text("Me Découvrir", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: text2Size),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ):Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: data.size.height / 2.5,
                                child: Image.asset("assets/propos.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(width: data.size.width / 2.5,child: Column(
                                      children: [
                                        Text("Je suis un homme simple, mais passionné", style: TextStyle(color: Colors.white, fontSize: text1Size, fontWeight: FontWeight.w700),),
                                        Text("Quand j'étais petit j'expliquais à ma mère que je ne voulais pas mélanger hobbies et Travail, heureusement que j'ai grandi...", style: TextStyle(color: Colors.grey, fontSize: text2Size, fontWeight: FontWeight.w400),),
                                      ],
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Material(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        color: Colors.transparent,
                                        child: InkWell(
                                          hoverColor: Colors.black38,
                                          onTap: (){
                                              Navigator.pushNamed(context, ProposPage.id);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(width: 4.0, color: Color(0xFFF7B13A))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0,),
                                              child: Text("Me Découvrir", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: text2Size),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: data.size.height / 6,),

                      ],
                    ),
                  ),
                ),
                BottomBar(),
              ],
            ),
            NavBar(scrollController: homeScrollController,),
            Chat(controller: homeScrollController,showChat:showChat)
          ],
        ),
      ),
    );
  }
}
