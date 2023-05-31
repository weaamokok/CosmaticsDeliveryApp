import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

import '../../utils/catagorySvgs.dart';
class CatagorySection extends StatelessWidget {
  const CatagorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(height: Dimensions.height100,
        child: ListView(
          //of containers to hold the caed and the text beneth
          scrollDirection:
              Axis.horizontal, //so the elements can be scrooled horizontlly
          children: [
            CatagoryCard(svgNormalSkin, 'عادية', Colors.white),
            CatagoryCard(svgOilySkin, 'دهنية', Colors.white),
            CatagoryCard(svgDrySkin, 'جافة', Colors.white),
            CatagoryCard(svgSensetiveSkin, 'حساسة', Colors.white),
            CatagoryCard(svgcombineSkin, 'مختلطة', Colors.white)
          ],
        ),
      ),
    );
  }
}
class CatagoryCard extends StatelessWidget {
  const CatagoryCard(this.illustration, this.catagory, this.cardsColor, {super.key});

  final Widget illustration;
  final String catagory;
  final Color? cardsColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      //column to place the text under the card
      children: [
        Container(
          width:
              80, //width and hieght of the pink card that contains illustration
          height: 80,
          margin: const EdgeInsets.all(10.0), //margin around each pink card
          decoration: BoxDecoration(
            color: cardsColor,
            border: Border.all(
                color: black.withOpacity(.3),
                width: .5,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.3),
            //     spreadRadius: 1,
            //     blurRadius: 10,
            //     offset: Offset(2, 2), // changes position of shadow
            //   ),
            // ],
          ),
          child: illustration,
        ),
       BigText(text: catagory,size: 15,)
      ],
    );
  }
}