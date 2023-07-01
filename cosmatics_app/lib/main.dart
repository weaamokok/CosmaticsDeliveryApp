import 'package:cosmatics_app/controllers/popular_products_controller.dart';
import 'package:cosmatics_app/pages/auth_pages/login_page.dart';
import 'package:cosmatics_app/pages/auth_pages/otp_verification_screen.dart';
import 'package:cosmatics_app/pages/splash/splash_screen.dart';
import 'package:cosmatics_app/route/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<BrandsController>().getDiorList();
    // Get.find<BrandsController>().getLorealList();
    // Get.find<BrandsController>().getMoovList();
  
    return GetBuilder<CartController>(builder: (controller) {
             Get.find<CartController>().getCartData();

      return GetBuilder<PopularProductController>(builder: (controller) =>  GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        getPages: RouteHelper.route,
        // initialRoute: RouteHelper.initial,
           home: const OtpVerificationScreen(phoneNum: '92038324')
      ),);
    },);
  }
}
