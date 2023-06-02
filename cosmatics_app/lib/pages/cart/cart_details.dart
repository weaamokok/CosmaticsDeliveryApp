import 'package:cosmatics_app/controllers/popular_products_controller.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimentions.dart';
import '../../widgets/app_icon.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.height20, vertical: Dimensions.height45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: blueush),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          AppIcon(
                            icon: Icons.shopping_bag,
                            iconColor: Colors.white,
                            size: Dimensions.height45,
                            onTap: () {},
                          ),
                          Container(
                            width: Dimensions.width45,
                            height: Dimensions.height20,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                color: Colors.orange),
                            child: Center(
                                child: Text(
                              controller.totalItems.toString(),
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                            )),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          child: Image.asset(
                            'assets/image/0.jpg',
                            width: Dimensions.height20 * 6,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.height10,
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BigText(
                              text: 'product name',
                              size: 18,
                            ),
                            BigText(
                              text: 'product details',
                              size: 16,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BigText(
                                  text: '\$14',
                                  size: 17,
                                ),
                                Container(
                                  child: Row(children: [
                                    IconButton(
                                      icon: const Icon(Icons.add,size: 20,),
                                      onPressed: () {},
                                    ),
                                    BigText(text: '0',size: 17,), IconButton(
                                      icon: const Icon(Icons.remove,size: 20,),
                                      onPressed: () {},
                                    ),
                                  ]),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          )),
    );
  }
}
