import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:flutter/material.dart';

import 'big_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? BigText(
                text: firstHalf,
                size: Dimensions.font17,
              )
            : Column(
                children: [
                  BigText(
                    text:
                        hiddenText ? (firstHalf + "" ):( widget.text),
                    size: Dimensions.font14,overflow: TextOverflow.visible,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText=!hiddenText;

                        print(hiddenText);
                      });
                    },
                    child: Row(
                      children: [
                        BigText(
                          text: 'إظهار المزيد',
                          size: 14,
                          color: blueush,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        Icon(
                         hiddenText? Icons.arrow_drop_down_outlined: Icons.arrow_drop_up_outlined,
                          color: blueush,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}
