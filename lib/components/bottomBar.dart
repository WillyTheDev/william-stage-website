import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    bool mediumView = data.size.width <= 1048;
    bool smallView = data.size.width <= 600;
    double contactSize = smallView
        ? data.size.width / 30
        : mediumView ? data.size.width / 40 : data.size.width / 110;
    double titleSize = smallView
        ? data.size.width / 40
        : mediumView ? data.size.width / 60 : data.size.width / 140;
    return Container(
      width: data.size.width,
      height: data.size.height / 6,
      color: Color(0xFF0D0D25),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact:", style: TextStyle(color: Colors.white, fontSize: contactSize, fontWeight: FontWeight.w700),),
                  Text("William Scholder" , style: TextStyle(color: Colors.grey, fontSize: titleSize),),
                  Text("Chemin de Bonlieu 20", style: TextStyle(color: Colors.grey, fontSize: titleSize),),
                  Text("1700 Fribourg", style: TextStyle(color: Colors.grey, fontSize: titleSize),),
                  Text("william.scholder@gmail.com", style: TextStyle(color: Colors.grey, fontSize: titleSize),),
                  Text("+41 79 944 21 46", style: TextStyle(color: Colors.grey, fontSize: titleSize),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
