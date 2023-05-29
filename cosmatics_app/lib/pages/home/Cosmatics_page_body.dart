import 'package:cosmatics_app/controllers/brands_controller.dart';
import 'package:cosmatics_app/controllers/top_sale_controllers.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/product.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../Brands/brand_products.dart';
import '../improved_product_details.dart';
import 'catagory_section.dart';
import 'main_cosmatics_page.dart';

class CosmaticsPageBody extends StatefulWidget {
  const CosmaticsPageBody({Key? key}) : super(key: key);

  @override
  State<CosmaticsPageBody> createState() => _CosmaticsPageBodyState();
}

class _CosmaticsPageBodyState extends State<CosmaticsPageBody> {
  PageController pageController = PageController(viewportFraction: .85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8; //is used to controll the scale
  final double _height = Dimensions.pageViewContainer; //height of the container
  @override
  void initState() {
    super.initState();
    //  Get.find<BrandsController>().getBrands();

    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<BrandsController>(
          builder: (controller) {
            if (controller.getBrandsList.isEmpty) {
              return Center(
                  child: CircularProgressIndicator(
                color: blueush,
              ));
            } else {
              return SizedBox(
                height: Dimensions.pageView,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: controller.getBrandsList.length > 5
                      ? 5
                      : controller.getBrandsList.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(() => BrandsPage(listOfProducts: controller.getBrandsList[index],));
                      },
                      child: _buildPageItem(
                          index, controller.getBrandsList[index])),
                ),
              );
            }
          },
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        GetBuilder<BrandsController>(
          builder: (controller) {
            return DotsIndicator(
              dotsCount: controller.getBrandsList.isEmpty
                  ? 1
                  : controller.getBrandsList.length > 5
                      ? 5
                      : controller.getBrandsList.length,
              position: _currentPageValue.round(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeColor: blueush,
                activeSize: const Size(18.0, 9.0),
                color: const Color.fromARGB(255, 203, 203, 203),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            );
          },
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        const SectionHeader(hintText: 'لانواع البشرة', mainText: 'تصنيفات'),
        const CatagorySection(),
        const SectionHeader(
            hintText: "منتجات مميزة", mainText: 'الاكثر مبيعاً'),
        GetBuilder<TopSaleProductController>(
          builder: (controller) {
            if (controller.gettopSaleProductList.isNotEmpty) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.gettopSaleProductList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImprovedProductDetails(
                                  product:
                                      controller.gettopSaleProductList[index]),
                            )),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius30),
                                border:
                                    Border.all(color: black.withOpacity(.2))),
                            // width: Dimensions.height150,
                            // height: Dimensions.height150,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width20,
                                vertical: Dimensions.height10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Image.network(
                                        controller.gettopSaleProductList[index]
                                            .imageLink
                                            .toString(), errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/image/error.png');
                                    },
                                        fit: BoxFit.cover,
                                        height: Dimensions.height90,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: Dimensions.height10,
                                    // ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: BigText(
                                              text: controller
                                                  .gettopSaleProductList[index]
                                                  .name,
                                              size: 13,
                                              color: black.withOpacity(.8),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Color.fromARGB(
                                                        255, 232, 211, 20),
                                                  ),
                                                  SizedBox(
                                                    width: Dimensions.width10,
                                                  ),
                                                  Text(
                                                    controller
                                                        .gettopSaleProductList[
                                                            index]
                                                        .rating
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: black
                                                            .withOpacity(.5)),
                                                  ),
                                                ],
                                              )),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.width10),
                                              child: BigText(
                                                text:
                                                    '${controller.gettopSaleProductList[index].price}' +
                                                        'د.ل',
                                                size: 14,
                                                wieght: FontWeight.w600,
                                                color: black.withOpacity(.7),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        width: 40,
                                        height: 40,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: Dimensions.height10,
                                            vertical: Dimensions.height10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15),
                                            color: blueush.withOpacity(.7)),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.favorite,
                                            size: 23,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        )))
                              ],
                            )),
                      );
                    },
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator(
                color: blueush,
              );
            }
          },
        )
      ],
    );
  }

  Widget _buildPageItem(int index, List<Product> product) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 -
          (_currentPageValue - index) *
              (1 - _scaleFactor); //give true only for the current page
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height *
          (1 - currScale) /
          2; //controlls the position of the next slid

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height *
          (1 - currScale) /
          2; //controlls the position of the next slid

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.height10,
                right: Dimensions.height10,
                top: Dimensions.height10),
            decoration: BoxDecoration(
                border: Border.all(color: blueush.withOpacity(.5)),
                // boxShadow: [
                //   BoxShadow(blurRadius: 5, color: black.withOpacity(.1))
                // ],
                image: DecorationImage(
                    image: NetworkImage(product.isNotEmpty
                        ? product[2].imageLink.toString()
                        : 'https://img.freepik.com/premium-vector/3d-realistic-cosmetic-product-vector-illustration_156780-764.jpg?w=2000'),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 255, 255, 255)),
            child: Container(),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.symmetric(
                    horizontal: 25, vertical: Dimensions.height5),
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 10, color: Colors.grey.withOpacity(.3))
                    // ],
                    border: Border.all(color: black.withOpacity(.1)),
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height30,
                      vertical: Dimensions.height30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text:
                              ' منتجات  ${product.isNotEmpty ? product[1].brand.toString() : ''}',
                          size: 17,
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IConAndTextWidget(
                              color: black.withOpacity(.7),
                              icon: Icons.circle,
                              iconColor: const Color.fromARGB(255, 235, 169, 4),
                              text: 'عناية بالبشرة',
                            ),
                            IConAndTextWidget(
                              color: black.withOpacity(.7),
                              icon: Icons.location_pin,
                              iconColor: blueush,
                              text: 'النوفليين ',
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
