import 'package:cosmatics_app/pages/product_details.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../widgets/icon_and_text_widget.dart';
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
  double _scaleFactor = 0.8; //is used to controll the scale
  double _height = Dimensions.pageViewContainer; //height of the container
  @override
  void initState() {
    super.initState();
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
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) => _buildPageItem(index),
          ),
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.round(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: blueush,
            activeSize: const Size(18.0, 9.0),
            color: Color.fromARGB(255, 203, 203, 203),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        SectionHeader(hintText: 'لانواع البشرة', mainText: 'تصنيفات'),
        CatagorySection(),
        SectionHeader(hintText: "منتجات مميزة", mainText: 'الاكثر مبيعاً'),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 700,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPage(),)),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
                          border: Border.all(color: black.withOpacity(.2))),
                      // width: Dimensions.height150,
                      // height: Dimensions.height150,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  'assets/image/e.png',
                                  fit: BoxFit.cover,
                                  width: Dimensions.height90,
                                  height: Dimensions.height90,
                                ),
                              ),
                              // SizedBox(
                              //   height: Dimensions.height10,
                              // ),
                              Expanded(
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Expanded(
                                      child: BigText(
                                        text: '12 ' + 'د.ل',
                                        size: 14,
                                        wieght: FontWeight.w600,
                                        color: black.withOpacity(.7),
                                      ),
                                    ),
                                    Expanded(
                                      child: BigText(
                                        text: 'LA ROCHE-POSAY ',
                                        size: 12,
                                        color: black.withOpacity(.8),
                                      ),
                                    ),
                                   
                                    Expanded(
                                      child: Wrap(
                                        children: List.generate(
                                            5,
                                            (index) => Icon(
                                                  Icons.star,
                                                  color: Color.fromARGB(
                                                      255, 226, 226, 36),
                                                  size: Dimensions.iconSize20,
                                                )),
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
                                    icon: Icon(
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
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
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
                left: Dimensions.height10, right: Dimensions.height10),
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/1.png'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.symmetric(
                    horizontal: 25, vertical: Dimensions.height10),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height20, vertical: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: 'منتجات LA ROCHE-POSAY',
                          size: 17,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
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
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IConAndTextWidget(
                              color: black.withOpacity(.7),
                              icon: Icons.circle,
                              iconColor: Color.fromARGB(255, 235, 169, 4),
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
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.grey.withOpacity(.3))
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
