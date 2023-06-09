import 'package:flutter/material.dart';

import '../domain/models/product.dart';
import '../utils/colors.dart';
import '../utils/dimentions.dart';
import 'big_text.dart';
class AppColumn extends StatelessWidget {
  final Product product;
  const AppColumn({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: product.name.toString(),size: Dimensions.font20,),
                    Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                    product.rating!=null? product.rating!.round():1,
                                    (index) =>product.rating!=null? Icon(
                                          Icons.star,
                                          color:
                                              const Color.fromARGB(255, 226, 226, 36),
                                          size: Dimensions.iconSize24,
                                        ):const Icon(Icons.star_outline_rounded))
                              ),
                              SizedBox(
                                width: Dimensions.height10,
                              ),
                              BigText(
                                text: product.rating!=null?product.rating.toString():'0.0',
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