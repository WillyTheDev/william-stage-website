import 'package:exploracode/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

Firestore _fs = Firestore.instance;

class Chat extends StatefulWidget {
  Chat({@required this.controller, this.showChat});
  ScrollController controller;
  bool showChat;
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  AuthGoogle authGoogle;
  Dialogflow dialogFlow;
  void initializeDialogFlow()async{
    print("DialogFlow initialized !");
    authGoogle = await AuthGoogle(fileJson: "assets/william-stage-5c269b2c0c33.json").build();
    dialogFlow = Dialogflow(authGoogle: authGoogle,language: Language.french);
  }
  bool chatIsOpen = false;
  final messageTextController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  String text = "";
  AIResponse response;

  @override
  void initState() {
    initializeDialogFlow();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    bool mediumView = data.size.width <= 1344;
    bool smallView = data.size.width <= 600;
    double titleSize = smallView
        ? data.size.width / 30
        : mediumView ? data.size.width / 60 : data.size.width / 80;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
      bottom: widget.controller.offset.toInt()  % 3 != 0 ? smallView ? data.size.width / 15 : data.size.height / 8 : data.size.height / 10,
      right: smallView ? data.size.width / 20 :data.size.height / 10,
      child: Stack(
        children: [
          AnimatedContainer(duration: Duration(milliseconds: 500), curve: Curves.bounceOut,
            height: chatIsOpen || widget.showChat ? smallView ? data.size.height / 1.2 : data.size.height / 1.5 : 0,
            width: chatIsOpen|| widget.showChat ? smallView ? data.size.width / 1.2 : data.size.width / 3 : 0,
            decoration: BoxDecoration(
              color: Color(0xFF171831),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(color: Colors.black45, offset: Offset(5.5, 5.5)),
                BoxShadow(color: Colors.grey.shade900.withOpacity(0.45), offset: Offset(-5.5, -5.5))
              ]
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.clear,color: Colors.grey,),iconSize: data.size.width / 40, onPressed: (){
                      setState(() {
                        widget.showChat = false;
                        chatIsOpen ? chatIsOpen = false : chatIsOpen = true;
                      });
                    }),
                    Spacer(
                      flex: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Rufus le Bot", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                        Text("Actif", style: TextStyle(color: Colors.lightBlue),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: data.size.width / 40,
                        child: Image.asset("assets/face.png"),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal : 16.0),
                  child: Divider(thickness: 2, color: Color(0xFF3E4064),),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: _fs.collection("Chat").document(email).collection("Chat").orderBy("date", descending: false).snapshots(),
                    builder: (context, snapshot){
                      if(!snapshot.hasData){
                        return Text("NO DATA");
                      }
                      final messages = snapshot.data.documents.reversed;
                      List<MessageBubble> messageBubbles = [];
                      for (var message in messages) {
                        final messageText = message.data["text"];
                        final messageSender = message.data["sender"];
                        final messageImage = message.data["image"];
                        final messageRankUser = message.data["rank"];
                        final messageBubble = MessageBubble(
                          rank: messageRankUser,
                          image: messageImage,
                          sender: messageSender,
                          text: messageText,
                          isMe: email ==
                              messageSender,
                        );
                        messageBubbles.add(messageBubble);
                      }
                      return Expanded(
                        child: ListView(
                          controller: _scrollController,
                          reverse: true,
                          padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                          children: messageBubbles,
                        ),
                      );
                    }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal : 16.0),
                  child: Divider(thickness: 2, color: Color(0xFF3E4064),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    controller: messageTextController,
                    onChanged: (value){
                      setState(() {
                        text = value.replaceAll("'", '"');
                      });
                    },
                      onSubmitted: (value)async {
                        _fs.collection("Chat").document(email).collection(
                            "Chat").document().setData({
                          "text": text,
                          "sender": email,
                          "image": "",
                          "date": DateTime
                              .now()
                              .millisecondsSinceEpoch,
                          "read": false,
                        });
                        messageTextController.clear();
                        DocumentSnapshot userData = await _fs.collection("Chat")
                            .document(email)
                            .get();
                        if (userData.data["read"] != true) {
                          response = await dialogFlow.detectIntent(text);
                          _fs.collection("Chat").document(email).collection(
                              "Chat").document().setData({
                            "text": response.getMessage(),
                            "sender": "Rufus le Bot",
                            "image": "",
                            "date": DateTime
                                .now()
                                .millisecondsSinceEpoch,
                            "read": false,
                          });
                        }
                      },
                    style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF3E4064)), borderRadius: BorderRadius.circular(20.0)),
                      hintText: "Envoyez moi un message...",
                      hintStyle: TextStyle(color: Color(0xFF3E4064)),
                      fillColor: Color(0xFF22244C),
                      suffixIcon: IconButton(icon: Icon(Icons.send), onPressed: ()async {
                        _fs.collection("Chat").document(email).collection(
                            "Chat").document().setData({
                          "text": text,
                          "sender": email,
                          "image": "",
                          "date": DateTime
                              .now()
                              .millisecondsSinceEpoch,
                          "read": false,
                        });
                        messageTextController.clear();
                        DocumentSnapshot userData = await _fs.collection("Chat")
                            .document(email)
                            .get();
                        if (userData.data["read"] != true) {
                          response = await dialogFlow.detectIntent(text);
                          _fs.collection("Chat").document(email).collection(
                              "Chat").document().setData({
                            "text": response.getMessage(),
                            "sender": "Rufus le bot",
                            "image": "",
                            "date": DateTime
                                .now()
                                .millisecondsSinceEpoch,
                            "read": false,
                          });
                        }
                      })
                      )
                    ),
                  ),
              ],
            ),
          ),
          email == "email" ? AnimatedContainer(duration: Duration(milliseconds: 500), curve: Curves.bounceOut,
            height: chatIsOpen || widget.showChat ? smallView ? data.size.height / 1.2 : data.size.height / 1.5 : 0,
            width: chatIsOpen  || widget.showChat ? smallView ? data.size.width / 1.2 : data.size.width / 3 : 0,
            decoration: BoxDecoration(
                color: Color(0xFF171831),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(color: Colors.black45, offset: Offset(5.5, 5.5)),
                  BoxShadow(color: Colors.grey.shade900.withOpacity(0.45), offset: Offset(-5.5, -5.5))
                ]
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.clear,color: Colors.grey,),iconSize: data.size.width / 40, onPressed: (){
                      setState(() {
                        chatIsOpen ? chatIsOpen = false : chatIsOpen = true;
                      });
                    }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Pour Chatter avec moi entrez votre email", style: TextStyle(color: Colors.white, fontSize: titleSize),),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
                  child: TextField(
                    onSubmitted: (value){
                      _fs.collection("Chat").document(email).setData({
                        "sender": email,
                        "date": DateTime
                            .now()
                            .millisecondsSinceEpoch,
                        "read": false,
                      });
                      messageTextController.clear();
                      setState(() {

                      });
                    },
                      controller: messageTextController,
                      onChanged: (value){
                          email = value;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF3E4064)), borderRadius: BorderRadius.circular(20.0)),
                          hintText: "email...",
                          hintStyle: TextStyle(color: Color(0xFF3E4064)),
                          fillColor: Color(0xFF22244C),
                      )
                  ),
                ),
                FlatButton(onPressed: (){
                  _fs.collection("Chat").document(email).setData({
                    "sender": email,
                    "date": DateTime
                        .now()
                        .millisecondsSinceEpoch,
                    "read": false,
                  });
                  messageTextController.clear();
                  setState(() {

                  });
                },color: Colors.amber,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)), child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Chatter 👋", style: TextStyle(color: Colors.white),),
                ))
              ],
            ),
          ) : Container(),
          InkWell(
            onTap: (){
              setState(() {
                chatIsOpen ? chatIsOpen = false : chatIsOpen = true;
              });
            },
            child: Visibility(
              visible: !chatIsOpen,
              child: Stack(
                children: [
                  Container(
                    width: smallView ? data.size.width / 7 : data.size.width / 20,
                    child: Image.asset("assets/face.png"),
                  ),
                  Positioned(
                    right: 0,
                      bottom: 0,
                      child: Icon(Icons.chat, color: Colors.white,size:smallView ? data.size.width / 30 : data.size.width / 60,))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {this.sender, this.text, this.isMe, this.image, @required this.rank});
  final int rank;
  final String sender;
  final String text;
  final bool isMe;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              color: Color(0xFF3E4064),
              fontSize: 14.0,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isMe ? Colors.amber : Color(0xFFE1E1E1),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: image == ""
                  ? Text(
                text,
                style: TextStyle(
                    color: isMe ? Colors.white : Color(0xFF171831),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: NetworkImage(image),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}