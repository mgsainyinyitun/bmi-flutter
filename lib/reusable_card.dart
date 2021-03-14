import 'package:flutter/material.dart';
class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.childCard,this.onPress});
  final Color colour;
  final Widget childCard;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        child: childCard,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular((10.0))),
      ),
    );
  }
}

