import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/models/contact_model.dart';

String getCapitalizeString({String str}) {
  if (str.length <= 1) {
    return str.toUpperCase();
  }
  return '${str[0].toUpperCase()}';
}

Widget getContactAvatar(ContactModel contact) {
  final random = Random();
  String initialLetter = getCapitalizeString(str: contact.name);
  Color color = Color.fromRGBO(
    random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

  if (contact.img == '') {
    return (CircleAvatar(
      child: Text(initialLetter),
      backgroundColor: color,
    ));
  }

  return (CircleAvatar(
    backgroundImage: AssetImage(contact.img),
  ));
}