import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.productDetailsImagHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/e.png'),
                      fit: BoxFit.cover)),
            )),
        Positioned(
            left: Dimensions.width20,top: Dimensions.height45,
            right: Dimensions.width20,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back,iconColor: Colors.white),
                AppIcon(icon: Icons.shopping_bag,iconColor: Colors.white)
              ],
            ))
      ]),
    );
  }
}
