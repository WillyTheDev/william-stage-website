import 'package:flutter/material.dart';

import 'chat.dart';
import 'components/bottomBar.dart';
import 'components/navigation.dart';

class ProposPage extends StatefulWidget {
  static String id = "ProposPage";
  @override
  _ProposPageState createState() => _ProposPageState();
}

class _ProposPageState extends State<ProposPage> {
  ScrollController proposScrollController = ScrollController();

  @override
  void initState() {
    proposScrollController.addListener(()async {
      setState(() {
      });
      print(proposScrollController.offset);
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
        ? data.size.width / 35
        : mediumView ? data.size.width / 50 : data.size.width / 80;
    double text2Size = smallView
        ? data.size.width / 45
        : mediumView ? data.size.width / 70 : data.size.width / 100;
    return Scaffold(
      backgroundColor: Color(0xFF171831),
      body: Stack(children: [
        Positioned(top: 0.0,
            left: 0.0,
            child: Container(
                width: data.size.width,
                height: data.size.height,
                child: Image.asset("assets/background.png", fit: BoxFit.cover,))),
        ListView(
          controller: proposScrollController,
          children: [
            SizedBox(
              height: data.size.height / 8,
            ),
            Center(
                child: Text(
                  "À propos de moi",
                  style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
            Center(
              child: Text(
                "C'est important de savoir à qui on a affaire...",
                style: TextStyle(
                    fontSize: subTitleSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: data.size.height / 12,),
            Align(alignment: Alignment.topCenter,child: Container(
              width: smallView ? data.size.width / 2 : data.size.width / 5,
                child: Image.asset("assets/moi.png"),),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  width: smallView ? data.size.width / 1.2 :data.size.width / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: smallView ? data.size.width / 3 :data.size.width / 4,
                        height: data.size.height / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Qui suis-je ?", style: TextStyle(color: Colors.white, fontSize: text1Size, fontWeight: FontWeight.w700),),
                            Text("Mes premières expériences de développement remontent à mes 8 ans avec RPG MAKER, j'ai toujours aimé la programmation, et j'ai depuis une année eu le temps de me lancé à 100%, j'ai depuis découvert une profonde passion pour la technologies et le développement, je cherche constamment à découvrir des outils, techniques et technologie et a étendre mes connaissance.", style: TextStyle(color: Colors.grey, fontSize: text2Size, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                      Container(
                        width: smallView ? data.size.width / 3 :data.size.width / 4,
                        height: data.size.height / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mes Hobbys", style: TextStyle(color: Colors.white, fontSize: text1Size, fontWeight: FontWeight.w700),),
                            Text("Mon temps-libre ne tourne pas uniquement autour du développement.\b J'ai quelques hobbys en dehors de cet univers, je fais pas mal de photographie en ville, j'adore préparer des bons petits plats, je joue à des jeux-vidéos quand j'ai le temps (Star-citizen, Star-craft 2, Stardew valleys).", style: TextStyle(color: Colors.grey, fontSize: text2Size, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Pour me contacter", style: TextStyle(color: Colors.white, fontSize: subTitleSize, fontWeight: FontWeight.w600),),
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("1 : Cliquez sur la tête de 'Rufus'.", style: TextStyle(
                      color: Colors.grey, fontSize: text1Size),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("2 : Rentrez votre email dans le champ.", style: TextStyle(
                          color: Colors.grey, fontSize: text1Size),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("3 : Chattez 'Rufus' répondra à presque toutes vos questions.", style: TextStyle(
                          color: Colors.grey, fontSize: text1Size),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("4 : Si je suis disponible, je prendrai le relais dès que possible !", style: TextStyle(
                          color: Colors.grey, fontSize: text1Size),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: data.size.height / 8,),
            SizedBox(height: data.size.height / 8,),
            BottomBar(),
          ],
        ),
        NavBar(
          scrollController: proposScrollController,
        ),
        Chat(controller: proposScrollController, showChat: false)
      ],),
    );
  }
}
