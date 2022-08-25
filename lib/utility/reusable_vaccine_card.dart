import 'package:flutter/material.dart';

import '../constant.dart';

class ReusableVaccineCard extends StatelessWidget {
  const ReusableVaccineCard(
      {required this.icons,
      required this.info,
      required this.message,
      required this.text});

  final IconData icons;
  final String info;
  final String message;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      height: 100,
      width: double.maxFinite,
      decoration: kContainerDecoration.copyWith(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons,
                  color: Colors.blue,
                  size: 45,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  info,
                  style: kHeaderTextStyle,
                ),
                Text(
                  message,
                  style: kNameTextStyle.copyWith(fontSize: 11),
                ),
                Text(
                  text,
                  style: kNameTextStyle.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
