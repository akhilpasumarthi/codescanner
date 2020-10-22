import 'package:flutter/material.dart';


class SlideBar extends StatelessWidget {
  SlideBar({this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: isSelected?6:4,
      width: 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: isSelected?Color(0xffff893b):Colors.grey,
      ),
    );
  }
}
