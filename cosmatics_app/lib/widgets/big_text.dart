import 'package:flutter/material.dart';
// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextAlign? algin;
  TextDirection? dirction;
  FontWeight? wieght;
  TextOverflow overflow;

  BigText(
      { Key? key,
      this.color,this.algin,
      this.size = 20,this.dirction,
      required this.text,this.wieght=FontWeight.normal,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: algin,
      overflow: overflow,textDirection:dirction,
      style: TextStyle(color: color, fontSize: size, fontFamily: 'Cairo',),
    );
  }
}
