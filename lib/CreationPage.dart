import 'package:exploracode/components/bottomBar.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'chat.dart';
import 'components/navigation.dart';

class CreationPage extends StatefulWidget {
  static String id = "CreationPage";
  @override
  _CreationPageState createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  ScrollController creaScrollController = ScrollController();

  @override
  void initState() {
    creaScrollController.addListener(()async {
      setState(() {
      });
      print(creaScrollController.offset);
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
        : mediumView ? data.size.width / 30 : data.size.width / 60;
    return Scaffold(
      backgroundColor: Color(0xFF171831),
      body: Stack(
        children: [
          Positioned(top: 0.0,
              left: 0.0,
              child: Container(
                width: data.size.width,
                  height: data.size.height,
                  child: Image.asset("assets/background.png", fit: BoxFit.cover,))),
          ListView(
            controller: creaScrollController,
            children: [
              SizedBox(
                height: data.size.height / 8,
              ),
              Center(
                  child: Text(
                    "Mes Créations",
                    style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
              Center(
                child: Text(
                  "Mes dernières créations qui ont été développées de A à Z complètement seul.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: subTitleSize,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
              ),
              SizedBox(height: data.size.height / 12,),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Project(
                        data: data,
                        imagePath: "assets/projects/william_stage.png",
                        title: "Le site 'William cherche un stage'",
                        description:
                        "Ce site est designé sur Figma et ensuite développé avec Flutter Web, la partie la plus importante concernant la création se situe aux niveau de l'UI/UX. On utilisera tout de même Firebase pour héberger le site et apporter des outils nécessaires pour comprendre comment les utilisateurs intéragissent avec ce site mais aussi DialogFlow pour ajouter un bot qui répondra aux questions.",
                        showFigma: true,
                        showFirebase: true,
                        showFlutter: true,
                        showDart: true,
                        showTypescript: false,
                        urlLink: "https://william-scholder.com/#/")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Spacer(flex: 1),
                    Project(
                        data: data,
                        imagePath: "assets/projects/couple_plus.png",
                        title: "Couple+ mobile app",
                        description:
                        "Couple est une application mobile Android/IOS qui permet à des couples d'améliorer leur relations de façon ludique en échangeant des services contre une monnaie, de faciliter les échanges en présentant nos besoins. et aussi de garder quelques souvenirs dans la base de données",
                        showFigma: true,
                        showFirebase: true,
                        showFlutter: true,
                        showDart: true,
                        showTypescript: true,
                        urlLink: "https://coupley-3f183.web.app/#")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Project(
                        data: data,
                        imagePath: "assets/projects/william_port.png",
                        title: "Le site 'William Scholder' Portfolio",
                        description:
                        "Ce site est designé sur Figma et ensuite développé avec Flutter Web, la partie la plus importante concernant la création se situe aux niveau de l'UI/UX. On utilisera tout de même Firebase pour héberger le site et apporter des outils nécessaires pour comprendre comment les utilisateurs intéragissent avec ce site.",
                        showFigma: true,
                        showFirebase: true,
                        showFlutter: true,
                        showDart: true,
                        showTypescript: true,
                        urlLink: "https://william-scholder.com/#/")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Spacer(flex: 1),
                    Project(
                        data: data,
                        imagePath: "assets/projects/komeet.png",
                        title: "Komeet mobile app",
                        description:
                        "Komeet est une application mobile Android/IOS. L'intérêt de l'application est de connecter les gens pour qu'ils se motivent à réaliser des objectifs quotidien hebdomadaires ou mensuels. Komeet mélange des éléments de Jeux-vidéos et du développement personnel pour créer un outils qui nous poussent à réaliser nos objectifs.",
                        showFigma: true,
                        showFirebase: true,
                        showFlutter: true,
                        showDart: true,
                        showTypescript: true,
                        urlLink: "https://komeet.io/#")
                  ],
                ),
              ),
              SizedBox(height: data.size.height / 8,),
              BottomBar(),
            ],
          ),
          NavBar(
            scrollController: creaScrollController,
          ),
          Chat(controller: creaScrollController, showChat: false)
        ],
      ),
    );
  }
}

class Project extends StatefulWidget {
  Project(
      {@required this.data,
        @required this.imagePath,
        @required this.title,
        @required this.description,
        @required this.showFigma,
        @required this.showFirebase,
        @required this.showFlutter,
        @required this.showDart,
        @required this.showTypescript,
        @required this.urlLink});
  MediaQueryData data;
  final String imagePath;
  final String title;
  final String description;
  final String urlLink;
  final bool showFigma;
  final bool showDart;
  final bool showFlutter;
  final bool showFirebase;
  final bool showTypescript;
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool showLink = false;
  @override
  Widget build(BuildContext context) {
    bool mediumView = widget.data.size.width <= 1048;
    bool smallView = widget.data.size.width <= 512;
    return MouseRegion(
      onEnter: (p) {
        print("mouseEnter");
        setState(() {
          showLink = true;
        });
      },
      onExit: (p) {
        print("mouseExit");
        setState(() {
          showLink = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0D0D25),
          borderRadius: BorderRadius.circular(5.0),),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: mediumView ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Container(
                        height: widget.data.size.width / 3,
                        decoration: BoxDecoration(boxShadow: []),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            image: AssetImage(widget.imagePath),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: widget.data.size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.data.size.width / 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: widget.data.size.width / 50),
                            ),
                          ),
                          Wrap(
                            children: [
                              Visibility(
                                visible: widget.showFigma,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: widget.data.size.width / 5,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: widget.data.size.width / 40,
                                          child: Image(
                                            image:
                                            AssetImage("assets/tool_images/figma.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Figma",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                widget.data.size.width / 40),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.showDart,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: widget.data.size.width / 5,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: widget.data.size.width / 40,
                                          child: Image(
                                            image:
                                            AssetImage("assets/tool_images/dart.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Dart",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                widget.data.size.width / 40),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.showFlutter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: widget.data.size.width / 5,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: widget.data.size.width / 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/tool_images/flutter.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Flutter",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                widget.data.size.width / 40),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.showFirebase,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: widget.data.size.width / 5,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: widget.data.size.width / 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/tool_images/firebase.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Firebase",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                widget.data.size.width / 40),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.showTypescript,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: widget.data.size.width / 5,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: widget.data.size.width / 40,
                                          child: Image(
                                            image: AssetImage("assets/tool_images/ts.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Typescript",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                widget.data.size.width / 40),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ): Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: widget.data.size.width / 2.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:smallView? widget.data.size.width / 30 : widget.data.size.width / 60),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: smallView?widget.data.size.width / 50 :widget.data.size.width / 100),
                            ),
                          ),
                          Wrap(
                            children: [
                              Visibility(
                                visible: widget.showFigma,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: smallView?widget.data.size.width / 5 :widget.data.size.width / 12,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: smallView?widget.data.size.width / 50 :widget.data.size.width / 100,
                                          child: Image(
                                            image:
                                            AssetImage("assets/tool_images/figma.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Figma",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                smallView?widget.data.size.width / 50 :widget.data.size.width / 100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.showDart,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: smallView?widget.data.size.width / 5 :widget.data.size.width / 12,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: smallView?widget.data.size.width / 50 :widget.data.size.width / 100,
                                          child: Image(
                                            image:
                                            AssetImage("assets/tool_images/dart.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Dart",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                smallView?widget.data.size.width / 50 :widget.data.size.width / 100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.showFlutter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: smallView?widget.data.size.width / 5 :widget.data.size.width / 12,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: smallView?widget.data.size.width / 50 :widget.data.size.width / 100,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/tool_images/flutter.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Flutter",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                smallView?widget.data.size.width / 50 :widget.data.size.width / 100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.showFirebase,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: smallView?widget.data.size.width / 5 :widget.data.size.width / 12,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: smallView?widget.data.size.width / 50 :widget.data.size.width / 100,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/tool_images/firebase.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Firebase",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                smallView?widget.data.size.width / 50 :widget.data.size.width / 100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.showTypescript,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: smallView?widget.data.size.width / 5 :widget.data.size.width / 12,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: smallView?widget.data.size.width / 50 :widget.data.size.width / 100,
                                          child: Image(
                                            image: AssetImage("assets/tool_images/ts.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Typescript",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                smallView?widget.data.size.width / 50 :widget.data.size.width / 100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Container(
                            height: smallView?widget.data.size.width / 2 :widget.data.size.width / 6,
                            decoration: BoxDecoration(boxShadow: []),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image(
                                image: AssetImage(widget.imagePath),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned.fill(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: showLink ? 1.0 : 0,
                child: FlatButton(
                  color: Color(0xFF0D0D25),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.amber, width: 5.0),
                      borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    js.context.callMethod("open", [widget.urlLink]);
                  },
                  child: Center(
                    child: Text(
                      "Voir le Projet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.data.size.width / 30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}