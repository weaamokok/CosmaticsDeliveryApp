import 'package:cosmatics_app/controllers/brands_controller.dart';
import 'package:cosmatics_app/controllers/popular_products_controller.dart';
import 'package:cosmatics_app/controllers/top_sale_controllers.dart';
import 'package:cosmatics_app/pages/splash/splash_screen.dart';
import 'package:cosmatics_app/route/route_helper.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'controllers/cart_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
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
    // Get.find<BrandsController>().getNyxList();
    // Get.find<BrandsController>().getmaybillineList();
  
    return GetBuilder<PopularProductController>(builder: (controller) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        getPages: RouteHelper.route,
        // initialRoute: RouteHelper.initial,
           home: const SplashScreen()
      );
    },);
  }
}
