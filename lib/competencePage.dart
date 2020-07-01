import 'package:exploracode/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'components/bottomBar.dart';
import 'components/navigation.dart';

class CompetencePage extends StatefulWidget {
  static String id = "CompetencePage";
  @override
  _CompetencePageState createState() => _CompetencePageState();
}

class _CompetencePageState extends State<CompetencePage> {
  ScrollController compScrollController = ScrollController();
  bool showUI = false;
  bool showWeb = false;
  bool showMobile = false;
  bool showAll = true;
  @override
  void initState() {
    compScrollController.addListener(()async {
      setState(() {
      });
      print(compScrollController.offset);
    });

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
                  child: Image.asset("assets/background.png", fit: BoxFit.fill,))),
          ListView(
            controller: compScrollController,
            children: [
              SizedBox(
                height: data.size.height / 8,
              ),
              Center(
                  child: Text(
                "Mes Compétences",
                style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Voici la Liste des outils, Languages, frameworks et SDK que j'utilise pour mes différents projets.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: subTitleSize,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: data.size.height / 12,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: data.size.width / 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(onPressed: (){
                      setState(() {
                        showAll = true;
                        showUI = false;
                        showWeb = false;
                        showMobile = false;
                      });
                    }, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Tous", style: TextStyle(color: Colors.white, fontSize: subTitleSize),),
                    ),color: showAll ? Color(0xFF0D0D25) : Colors.transparent,),
                    Visibility(
                      visible: !smallView,
                      child: FlatButton(onPressed: (){
                        setState(() {
                          showAll = false;
                          showUI = true;
                          showWeb = false;
                          showMobile = false;
                        });
                      }, child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("UI/UX Design", style: TextStyle(color: Colors.white, fontSize: subTitleSize),),
                      ),color: showUI ? Color(0xFF0D0D25) : Colors.transparent,),
                    ),
                    Visibility(
                      visible: !smallView,
                      child: FlatButton(onPressed: (){
                        setState(() {
                          showAll = false;
                          showUI = false;
                          showWeb = true;
                          showMobile = false;
                        });
                      }, child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Web", style: TextStyle(color: Colors.white, fontSize: subTitleSize),),
                      ),color: showWeb ? Color(0xFF0D0D25) : Colors.transparent,),
                    ),
                    Visibility(
                      visible: !smallView,
                      child: FlatButton(onPressed: (){
                        setState(() {
                          showAll = false;
                          showUI = false;
                          showWeb = false;
                          showMobile = true;
                        });
                      }, child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Mobile", style: TextStyle(color: Colors.white, fontSize: subTitleSize),),
                      ),color: showMobile ? Color(0xFF0D0D25) : Colors.transparent,),
                    ),
                  ],
                ),
              ),
              showAll ? Padding(
                padding: EdgeInsets.symmetric(horizontal: data.size.width / 5),
                child: Container(
                  color: Color(0xFF0D0D25),
                  child: Wrap(
                    spacing: 16.0,
                    children: [
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/figma.png",
                          text: "Figma",
                          url: "https://www.figma.com/design/"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/dart.png",
                          text: "Dart",
                          url:
                          "https://dart.dev/?utm_source=dart-lang_github_io&utm_medium=Redirect&utm_content=meta_refresh"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/flutter.png",
                          text: "Flutter",
                          url: "https://flutter.dev/"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/firebase.png",
                          text: "Firebase",
                          url: "https://firebase.google.com/"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/ts.png",
                          text: "Typescript",
                          url:
                          "https://www.typescriptlang.org/index.html"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/python.png",
                          text: "Python",
                          url:
                          "https://www.python.org/")
                    ],
                  ),
                ),
              ): showUI ? Padding(
                padding: EdgeInsets.symmetric(horizontal: data.size.width / 5),
                child: Container(

                  color: Color(0xFF0D0D25),
                  child: Wrap(
                    spacing: 16.0,
                    children: [
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/figma.png",
                          text: "Figma",
                          url: "https://www.figma.com/design/")
                    ],
                  ),
                ),
              ): showWeb ?Padding(
                padding: EdgeInsets.symmetric(horizontal: data.size.width / 5),
                child: Container(
                  color: Color(0xFF0D0D25),
                  child: Wrap(
                    spacing: 16.0,
                    children: [
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/dart.png",
                          text: "Dart",
                          url:
                          "https://dart.dev/?utm_source=dart-lang_github_io&utm_medium=Redirect&utm_content=meta_refresh"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/flutter.png",
                          text: "Flutter",
                          url: "https://flutter.dev/"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/firebase.png",
                          text: "Firebase",
                          url: "https://firebase.google.com/"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/ts.png",
                          text: "Typescript",
                          url:
                          "https://www.typescriptlang.org/index.html"),
                    ],
                  ),
                ),
              ): Padding(
                padding: EdgeInsets.symmetric(horizontal: data.size.width / 5),
                child: Container(

                  color: Color(0xFF0D0D25),
                  child: Wrap(
                    spacing: 16.0,
                    children: [
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/dart.png",
                          text: "Dart",
                          url:
                          "https://dart.dev/?utm_source=dart-lang_github_io&utm_medium=Redirect&utm_content=meta_refresh"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/flutter.png",
                          text: "Flutter",
                          url: "https://flutter.dev/"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/firebase.png",
                          text: "Firebase",
                          url: "https://firebase.google.com/"),
                      ToolWidget(
                          data: data,
                          imagePath: "assets/tool_images/ts.png",
                          text: "Typescript",
                          url:
                          "https://www.typescriptlang.org/index.html"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: data.size.height / 8,),
              Center(
                  child: Text(
                    "Ma RoadMap",
                    style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
              Center(
                child: Text(
                  "Ce que j'apprends en ce moment",
                  style: TextStyle(
                      fontSize: subTitleSize,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
              ),
              SizedBox(height: data.size.height / 12,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: data.size.width / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: data.size.width / 14,
                          child: Image.asset("assets/roadmap/html.png"),
                        ),
                        Container(
                          width: data.size.width / 20,
                          child: Image.asset("assets/roadmap/css.png"),
                        ),
                        Container(
                          width: data.size.width / 20,
                          child: Image.asset("assets/roadmap/bootstrap.png"),
                        ),
                        Container(
                          width: data.size.width / 20,
                          child: Image.asset("assets/roadmap/js.png"),
                        ),
                        Container(
                          width: data.size.width / 20,
                          child: Image.asset("assets/roadmap/node.png"),
                        ),
                        Container(
                          width: data.size.width / 18,
                          child: Image.asset("assets/roadmap/mongodb.png"),
                        ),
                        Container(
                          width: data.size.width / 14,
                          child: Image.asset("assets/roadmap/react.png"),
                        ),
                        Container(
                          width: data.size.width / 16,
                          child: Image.asset("assets/roadmap/angular.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: data.size.width / 1.2,
                        height: data.size.height / 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF0D0D25),
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                      ),
                      Container(
                        width: data.size.width / 2,
                        height: data.size.height / 50,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: data.size.height / 4,),
              SizedBox(height: data.size.height / 8,),
              BottomBar(),
            ],
          ),
          NavBar(
            scrollController: compScrollController,
          ),
          Chat(controller: compScrollController, showChat: false)
        ],
      ),
    );
  }
}

class ToolWidget extends StatelessWidget {
  const ToolWidget({
    @required this.data,
    @required this.imagePath,
    @required this.text,
    @required this.url,
  });

  final String imagePath;
  final String url;
  final String text;
  final MediaQueryData data;

  @override
  Widget build(BuildContext context) {
    bool smallView = data.size.width <= 500;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: smallView ? data.size.width / 2 : data.size.width / 6,
        child: InkWell(
          onTap: () {
            js.context.callMethod("open", [url]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: smallView ? data.size.width /10 :data.size.width / 30,
                child: Image(
                  image: AssetImage(imagePath),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white, fontSize:smallView ? data.size.width /20 : data.size.width / 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
