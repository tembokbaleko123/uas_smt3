import 'package:flutter/material.dart';

const kHitam = Color(0xff000000);
const kCoklat = Color(0xff743E28);
const kPutih = Color(0xffFFFFFF);
const kAbu = Color(0xff6C6A6A);
const kTextFieldDecoration = InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))));

const kSnackbar = SnackBar(
  content: Text('Coba Ulangi Kembali..'),
  duration: Duration(seconds: 2),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
