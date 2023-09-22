import 'package:flutter/material.dart';

final styleforFolder = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
    overlayColor: MaterialStateProperty.all(Color(0)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))));

final styleforDir =
    TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold);

final styleforCount = TextStyle(
    fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey[500]);

final styleforEdit = ButtonStyle(
  foregroundColor: MaterialStateProperty.all(Colors.amber[600]),
  overlayColor: MaterialStateProperty.all(Color(0)),
);

final styleforPin = ButtonStyle(
    textStyle: MaterialStateProperty.all(TextStyle(
      overflow: TextOverflow.ellipsis,
    )),
    // overlayColor: MaterialStateProperty.all(Color(0)),
    overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 35, 35, 35)),
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 30, 30, 30)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));

final styletextPin = TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis);
final styleaboutPin = TextStyle(
  fontSize: 16,
  color: Colors.grey[500],
  overflow: TextOverflow.ellipsis,
);

final errorStyle = TextStyle(color: Colors.red, fontSize: 22);
