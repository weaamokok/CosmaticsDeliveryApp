import 'package:flutter/material.dart';
// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  FontWeight? wieght;
  TextOverflow overflow;

  BigText(
      { Key? key,
      this.color,
      this.size = 20,
      required this.text,this.wieght=FontWeight.normal,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: TextAlign.center,
      overflow: overflow,textDirection: TextDirection.rtl,
      style: TextStyle(color: color, fontSize: size, fontFamily: 'Cairo',),
    );
  }
}
