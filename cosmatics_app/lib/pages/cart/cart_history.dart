import 'package:cosmatics_app/controllers/cart_controller.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimentions.dart';

class CartHisory extends StatelessWidget {
  const CartHisory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            leading: Container(),
            centerTitle: true,
            backgroundColor: blueush,
            title: Padding(
              padding: EdgeInsets.only(top: Dimensions.height10),
              child: BigText(
                text: 'سجل طلباتك  ',
                size: 20,
              ),
            ),
          )),
      body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.height10, vertical: Dimensions.height30),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [OrderHistoryView()],
            ),
          )),
    );
  }
}

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPreOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPreOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPreOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPreOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartOrderTimeToList() {
      return cartItemsPreOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();
    var listCounter = 0;
    return ListView(
      shrinkWrap: true,
      children: [
        for (int i = 0; i < itemsPerOrder.length; i++)
          Container(
            margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: getCartHistoryList[listCounter].time!.split(' ').first,size: 15),
                Row(
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(itemsPerOrder[i], (index) {
                        if (listCounter < getCartHistoryList.length) {
                          listCounter++;
                        }
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.height5),
                          decoration: BoxDecoration(
                            //  border: Border.all(color: black.withOpacity(.5)),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      getCartHistoryList[listCounter - 1]
                                          .img!))),
                          height: Dimensions.height70,
                          width: Dimensions.height70,
                        );
                      }),
                    )
                  ],
                )
              ],
            ),
          )
      ],
    );
  }
}
