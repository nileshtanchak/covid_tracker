import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

class ReusableHelpContainer extends StatelessWidget {
  const ReusableHelpContainer(
      {required this.icons,
      required this.helplineNumber,
      required this.helpInfo,
      required this.text,
      required this.colour,
      required this.insets,
      required this.ontap});

  final IconData icons;
  final String helplineNumber;
  final String helpInfo;
  final String text;
  final Color colour;
  final EdgeInsetsGeometry insets;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: insets,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(color: Colors.black26),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icons,
              size: 30,
              color: colour,
            ),
            Text(
              helplineNumber,
              style: kABHATextStyle.copyWith(fontSize: 20),
            ),
            Text(
              helpInfo,
              style: kABHATextStyle,
            ),
            Text(
              text,
              style: kABHATextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
