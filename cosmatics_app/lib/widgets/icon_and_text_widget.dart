import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class IConAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color color;
  const IConAndTextWidget({Key? key ,required this.icon,required this.iconColor,required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon,color: iconColor,),SizedBox(width: 5,),BigText(text: text,color: color,size: 12,)],);
  }
}