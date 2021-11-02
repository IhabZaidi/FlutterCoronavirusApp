// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class CustomImageWidget extends StatelessWidget {
  final String imgpath;
  final double width;
  final double height;
  double? borderradius;
 CustomImageWidget({
    Key? key,
    required this.imgpath,
    required this.width,
    required this.height,
    this.borderradius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        borderRadius: borderradius != null ? BorderRadius.circular(borderradius!) : BorderRadius.circular(0),
        image: DecorationImage(
          image: AssetImage(imgpath),
         // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
