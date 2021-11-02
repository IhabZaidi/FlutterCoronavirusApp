// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  double? textsize;
  Color? textcolor;
  FontWeight? fontWeight;

  TextWidget({
    Key? key,
    required this.text,
    this.textsize,
    this.textcolor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.cairo(
        fontStyle: FontStyle.normal,
        fontSize: textsize,
        fontWeight: fontWeight ?? FontWeight.bold,
        textStyle: TextStyle(
          color: textcolor ?? Colors.black,
        ),
      ),
    );
  }
}
