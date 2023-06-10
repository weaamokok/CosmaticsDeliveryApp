import 'dart:convert';

import 'package:cosmatics_app/controllers/cart_controller.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/widgets/app_icon.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../domain/models/cart.dart';
import '../../utils/dimentions.dart';

class CartHisory extends StatelessWidget {
  const CartHisory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.height10,
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.height100 / 3,
                      left: Dimensions.height20,
                      right: Dimensions.height20,
                      bottom: Dimensions.height10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: 'سجل طلباتك  ',
                        dirction: TextDirection.rtl,
                        size: 20,
                      ),
                      AppIcon(
                          size: Dimensions.height45,
                          icon: Icons.arrow_forward,
                          onTap: () {}),
                    ],
                  ),
                ),
                Divider(color: blueush.withOpacity(.5)),
                OrderHistoryView()
              ],
            ),
          )),
    );
  }
}

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPreOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPreOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPreOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPreOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartItemsPerOrderToList() {
      return cartItemsPreOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPreOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;
    return itemsPerOrder.isNotEmpty
        ? Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (int i = 0; i < itemsPerOrder.length; i++)
                  Container(
                    height: Dimensions.height150 / 2.5,
                    margin:
                        EdgeInsets.symmetric(horizontal: Dimensions.height20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (() {
                              DateTime parsedDate =
                                  intl.DateFormat('yyyy-MM-dd HH:mm:ss').parse(
                                      getCartHistoryList[listCounter].time!);
                              var inputDate =
                                  DateTime.parse(parsedDate.toString());
                              var outputformat =
                                  intl.DateFormat('MM/dd/yyyy hh:mm a');
                              return BigText(
                                  color: black.withOpacity(.8),
                                  text: outputformat.format(inputDate),
                                  size: 15);
                            }()),
                            SizedBox(
                              height: Dimensions.height5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(itemsPerOrder[i], (index) {
                                    if (listCounter <
                                        getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return index <= 2
                                        ? Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    Dimensions.height5 / 2),
                                            decoration: BoxDecoration(
                                                //  border: Border.all(color: black.withOpacity(.5)),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius15),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        getCartHistoryList[
                                                                listCounter - 1]
                                                            .img!))),
                                            height: Dimensions.height100 / 3,
                                            width: Dimensions.height100 / 3,
                                          )
                                        : Container();
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: Dimensions.height150 / 3.4,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(
                                  text: '${itemsPerOrder[i].toString()} منتج',
                                  size: 13,
                                  color: black.withOpacity(.8),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                InkWell(
                                  onTap: () {
                                    print('shit');
                                    var orderTime = cartOrderTimeToList();
                                    Map<int, Cart> moreOrder =
                                        {}; //to fill up items
                                    for (int j = 0;
                                        j < getCartHistoryList.length;
                                        j) {
                                      if (getCartHistoryList[j].time ==
                                          orderTime[i]) {
                                        moreOrder.putIfAbsent(
                                            getCartHistoryList[j].id!,
                                            () => Cart.fromJson(jsonDecode(
                                                jsonEncode(
                                                    getCartHistoryList[j]))));
                                      }
                                    }
                                    Get.find<CartController>().setItems=moreOrder;
                                    Get.find<CartController>().addToCartList();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height5 / 3,
                                        horizontal: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      color: blueush,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius15 / 2),
                                    ),
                                    child: BigText(
                                      text: 'تأكيد الطلب',
                                      size: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  )
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: Dimensions.screenHeight / 4),
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
                text: ' لا توجد مشتريات في سلتك بعد\nستضاف المشتريات هنا',
                size: 17,
              )
            ])),
          );
  }
}
