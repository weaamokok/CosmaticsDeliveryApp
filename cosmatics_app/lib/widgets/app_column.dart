import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimentions.dart';
import 'big_text.dart';
class AppColumn extends StatelessWidget {
  final String productName;
  const AppColumn({super.key,required this.productName});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: ' LA ROCHE-POSAY ',size: Dimensions.font20,),
                    Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color:
                                              Color.fromARGB(255, 226, 226, 36),
                                          size: Dimensions.iconSize24,
                                        )),
                              ),
                              SizedBox(
                                width: Dimensions.height10,
                              ),
                              BigText(
                                text: '4.5',
                                size: 12,
                                color: black.withOpacity(.7),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              BigText(
                                text: '12',
                                size: 12,
                                color: black.withOpacity(.7),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              BigText(
                                text: 'تعليق',
                                size: 12,
                                color: black.withOpacity(.7),
                              )
                            ],
                          ),
                  ],
                );
  }
}