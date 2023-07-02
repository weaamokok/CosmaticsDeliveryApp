import 'dart:async';

import 'package:cosmatics_app/pages/home/home_page.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/brands_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/popular_products_controller.dart';
import '../../controllers/top_sale_controllers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds:200 ))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 2), () {Get.to(()=>const HomePage()); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height100,),
          ScaleTransition(scale: animation,
            child: Image.asset(
              'assets/image/Cosmo.png',
              width: Dimensions.height150/1.5,
              height: Dimensions.height150/1.5,
            ),
          ),
          SizedBox(width: Dimensions.height100,child: LinearProgressIndicator(minHeight: 5,color:blueush.withOpacity(.4),backgroundColor: Color(0xffF39422),)),
        ],
      )),
      backgroundColor: Colors.white,
    );
  }
}
