import 'package:flutter/material.dart';

const kBasicTextStyle = TextStyle(fontSize: 15, color: Colors.black26);
const kNameTextStyle = TextStyle(fontSize: 10, color: Colors.black);
const kStateDataTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black);
const kRowTextStyle =
    TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
const kDataTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.red);
const kContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(2.0, 2.0),
      blurRadius: 3,
    ),
    BoxShadow(
      color: Colors.black12,
      offset: Offset(-2.0, 2.0),
      blurRadius: 3,
    )
  ],
);
const kABHATextStyle = TextStyle(fontWeight: FontWeight.w700);
const kButtonTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const kStatusFirstContainerTextStyle =
    TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500);
const kHeaderTextStyle = TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500);
