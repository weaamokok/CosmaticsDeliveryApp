import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../widgets/icon_and_text_widget.dart';

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
        ),SizedBox(height: Dimensions.height20,), DotsIndicator(
  dotsCount: 5,
  position:_currentPageValue.round(),
  decorator: DotsDecorator(
    size: const Size.square(9.0),activeColor: blueush,
    activeSize: const Size(18.0, 9.0),color: Color.fromARGB(255, 203, 203, 203),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
    }else  if (index == _currentPageValue.floor() - 1) {
     var currScale = 1 -
          (_currentPageValue - index) *
              (1 - _scaleFactor);
      var currTrans = _height *
          (1 - currScale) /
          2; //controlls the position of the next slid

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }else {
      var currScale=0.8;
            matrix = Matrix4.diagonal3Values(1, currScale, 1)        ..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);


    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.height10, right: Dimensions.height10),
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
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: Dimensions.height10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.height20, vertical: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: 'منتجات LA ROCHE-POSAY',
                          size: 17,
                        ),
                        SizedBox(
                          height:Dimensions.height10,
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
                              width:  Dimensions.width10,
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
