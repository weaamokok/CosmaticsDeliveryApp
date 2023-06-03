import 'package:cosmatics_app/controllers/brands_controller.dart';
import 'package:cosmatics_app/controllers/cart_controller.dart';
import 'package:cosmatics_app/controllers/popular_products_controller.dart';
import 'package:cosmatics_app/controllers/top_sale_controllers.dart';
import 'package:cosmatics_app/data/api/api_client.dart';
import 'package:cosmatics_app/data/repository/brands_repo.dart';
import 'package:cosmatics_app/data/repository/cart_repo.dart';
import 'package:cosmatics_app/data/repository/popular_products_repo.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/top_sale_repo.dart';

Future<void> init() async {
  final sharedPreferences=await SharedPreferences.getInstance();

//we give it to the get
  Get.lazyPut(() => sharedPreferences);


  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => TopSaleProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => BrandRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));
//controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => TopSaleProductController(topSaleProductRepo: Get.find()));
  Get.lazyPut(() => BrandsController(brandsRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  return;
}
