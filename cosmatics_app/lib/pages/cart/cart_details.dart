
import 'package:cosmatics_app/controllers/cart_controller.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:cosmatics_app/pages/home/home_page.dart';
import 'package:cosmatics_app/pages/improved_product_details.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                     // print(context);
Get.to(()=>HomePage());                        },
                      ),
                    ),
                    GetBuilder<CartController>(
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
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
                GetBuilder<CartController>(
                  builder: (controller) {
                    if (controller.getCartItems.isEmpty) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: Dimensions.screenHeight / 4),
                        child: Center(
                            child: Column(children: [
                          Image.asset(
                            'assets/image/empty cart.png',
                            width: Dimensions.height100 * 2,
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          BigText(
                            text:
                                ' لا توجد مشتريات في سلتك بعد\nستضاف المشتريات هنا',
                            size: 17,
                          )
                        ])),
                      );
                    } else {
                      print(controller.getCartItems.first.price);
                      final _cartList = controller.getCartItems;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.getCartItems.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Get.to(() => ImprovedProductDetails(
                                product: _cartList[index].product as Product)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimensions.height10),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    child: Image.network(
                                      controller.getCartItems[index].img
                                          .toString(),
                                      width: Dimensions.height20 * 6,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.height20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: controller
                                              .getCartItems[index].name
                                              .toString(),
                                          size: 17,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text:
                                                 controller
                                              .getCartItems[index].price.toString() + '  د.ل  ',
                                              size: 18,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius15),
                                                  border: Border.all(
                                                      color: black
                                                          .withOpacity(.2))),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.width10),
                                              child: Row(children: [
                                                IconButton(
                                                  icon: Icon(Icons.remove,
                                                      size: 20,
                                                      color: black
                                                          .withOpacity(.8)),
                                                  onPressed: () {
                                                    controller.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        -1);
                                                  },
                                                ),
                                                BigText(
                                                  text: controller
                                                      .getCartItems[index]
                                                      .quantity
                                                      .toString(),
                                                  color: black.withOpacity(.5),
                                                  size: 17,
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.add,
                                                      size: 20,
                                                      color: black
                                                          .withOpacity(.8)),
                                                  onPressed: () {
                                                    controller.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        1);
                                                  },
                                                ),
                                              ]),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                )
              ],
            )),
      ),        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) {
            return Container(
              height: Dimensions.bottomHeight,
              decoration: BoxDecoration(
                  color: blueush.withOpacity(0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius30),
                      topRight: Radius.circular(Dimensions.radius30))),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width45,
                  vertical: Dimensions.height20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal: Dimensions.height30),
                      decoration: BoxDecoration(
                          border: Border.all(color: black.withOpacity(.4)),

                          // boxShadow: [
                          //   BoxShadow(
                          //       blurRadius: 10,
                          //       color: black.withOpacity(.1),
                          //       offset: Offset(0, -2))
                          // ],
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white),
                      child: BigText(text: controller.totalAmount.toStringAsFixed(2)+' د.ل ',color:black,),
                    ),
                    InkWell(
                      onTap: () {
                    
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height10,
                            horizontal: Dimensions.height70),
                        decoration: BoxDecoration(
                            border: Border.all(color: black.withOpacity(.4)),
                            // boxShadow: [
                            //   BoxShadow(
                            //       blurRadius: 10,
                            //       color: black.withOpacity(.1),
                            //       offset: Offset(0, -2))
                            // ],
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: blueush),
                        child: BigText(text:'الدفع ' ,color: Colors.white,)
                      ),
                    )
                  ]),
            );
          },
        )
    );
  }
}
