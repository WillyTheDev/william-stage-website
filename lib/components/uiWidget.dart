import 'package:flutter/material.dart';

class UISize {
  UISize({@required this.size});
  double size;




}


class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({@required this.asset, @required this.top});
  final String asset;
  final double top;
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Positioned(
      left: -10,
      top: top,
      child: Container(
        height: data.size.height * 1.10,
        width: data.size.width * 1.01,
        child: Image.asset(
          "assets/parallax/$asset.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}