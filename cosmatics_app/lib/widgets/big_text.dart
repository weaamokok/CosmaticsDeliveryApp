import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  FontWeight? wieght;
  TextOverflow overflow;

  BigText(
      {Key? key,
      this.color,
      this.size = 20,
      required this.text,this.wieght=FontWeight.normal,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,textDirection: TextDirection.rtl,
      style: TextStyle(color: color, fontSize: size, fontFamily: 'Cairo',),
    );
  }
}
