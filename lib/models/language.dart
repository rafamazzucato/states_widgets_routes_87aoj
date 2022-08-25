import 'package:flutter/material.dart';

class Language {
  final String title;
  final String subTitle;
  bool select = false;
  IconData icon = Icons.add_box_outlined;

  Language(this.title, this.subTitle);
}