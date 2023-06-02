import 'package:cosmatics_app/controllers/cart_controller.dart';
import 'package:cosmatics_app/controllers/popular_products_controller.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:cosmatics_app/route/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/dimentions.dart';
import '../widgets/app_column.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';
import '../widgets/exoandable_text.dart';
import 'Brands/brand_products.dart';
import 'cart/cart_details.dart';

class ImprovedProductDetails extends StatelessWidget {
  final Product product;
  const ImprovedProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back,
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(
                          icon: Icons.shopping_bag,
                          iconColor: Colors.white,
                          onTap: () {
                           Get.toNamed(RouteHelper.getCartDetails());
                          },

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
                            style: const TextStyle(fontSize: 13),
                          )),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
            expandedHeight: 300,
            pinned: false,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                product.imageLink.toString(),
                width: double.maxFinite,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  height: Dimensions.screenHeight,
                  padding: EdgeInsets.only(
                      right: Dimensions.width30,
                      left: Dimensions.width30,
                      top: Dimensions.height30),
                  decoration: BoxDecoration(
                      border: Border.all(color: black.withOpacity(.1)),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius30),
                          topRight: Radius.circular(Dimensions.radius30)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        product: product,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(
                        text: 'عن المنتج:',
                        size: Dimensions.font17,
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                              text: product.description.toString()),
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ]),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Container(
              height: Dimensions.bottomHeight,
              decoration: BoxDecoration(
                  color: blueush,
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
                          EdgeInsets.symmetric(vertical: Dimensions.height5),
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
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              controller.setQuantitiy(false);
                            },
                            icon: Icon(
                              Icons.remove,
                              color: black.withOpacity(.8),
                            )),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        BigText(
                          text: controller.quantity.toString(),
                          color: black.withOpacity(.5),
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        IconButton(
                            onPressed: () {
                              controller.setQuantitiy(true);
                            },
                            icon: Icon(
                              Icons.add,
                              color: black.withOpacity(.8),
                            )),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        controller.addItem(product);
                        product.price;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height10,
                            horizontal: Dimensions.width20),
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
                        child: Row(
                          children: [
                            BigText(
                              text: ' ${product.price} \$',
                              color: const Color.fromARGB(255, 215, 96, 17),
                            ),
                            BigText(
                              text: ' إضافة للسلة |',
                              color: black.withOpacity(.7),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            );
          },
        ));
  }
}
