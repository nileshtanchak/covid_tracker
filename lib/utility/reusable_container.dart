import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer(
      {Key? key,
      required this.selectedIndex,
      required this.icons,
      required this.colour})
      : super(key: key);

  final Border selectedIndex;
  final IconData icons;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      height: 50,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
        border: selectedIndex,
        boxShadow: const [
          BoxShadow(
              offset: Offset(-2.0, 2.0),
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 2.0),
        ],
      ),
      child: Tab(
        icon: Icon(
          icons,
          color: colour,
        ),
      ),
    );
  }
}
