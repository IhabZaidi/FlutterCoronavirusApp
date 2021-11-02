// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:coronavirusapp/presentation/widgets/cutom_image.dart';
import 'package:coronavirusapp/presentation/widgets/text_widget.dart';
import 'package:coronavirusapp/presentation/widgets/wsized.dart';

class CardWidget extends StatelessWidget {
  final String path;
  final String txt1;
  final String txt2;
  final Color color;
  const CardWidget({
    Key? key,
    required this.path,
    required this.txt1,
    required this.txt2,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.38,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WSizedBox(wval: 0, hval: 0.02),
          CustomImageWidget(
            imgpath: path,
            width: 0.15,
            height: 0.1,
          ),
          TextWidget(
            text: txt1,
            textcolor: Colors.black87,
            textsize: 12,
          ),
          TextWidget(
            text: txt2,
            textcolor: Colors.white,
            textsize: 12,
          ),
        ],
      ),
    );
  }
}
