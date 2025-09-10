import 'package:flutter/cupertino.dart';

class todo{
  String title;
  String detail;
  bool isCompleted;
  todo(
    {
      required this.title,
      required this.detail,
      this.isCompleted=false

    });
}