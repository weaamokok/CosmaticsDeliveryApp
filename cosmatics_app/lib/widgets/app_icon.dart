import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final Function onTap;
  const AppIcon(
      {super.key,
      required this.icon,
      this.iconColor = const Color(0xffffffff),
      this.size = 40,required this.onTap,
      this.backgroundColor = const Color(0xff95B6C7)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor,borderRadius: BorderRadius.circular(Dimensions.radius15)),
    child: IconButton(icon: Icon(icon,size: 20,color: iconColor,),onPressed: () => onTap(),),
    );
  }
}
