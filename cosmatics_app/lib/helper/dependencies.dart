import 'package:cosmatics_app/controllers/popular_products_controller.dart';
import 'package:cosmatics_app/data/api/api_client.dart';
import 'package:cosmatics_app/data/repository/popular_products_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void>init() async{
  //api client
Get.lazyPut(()=>ApiClient(appBaseUrl: 'https://www.google.com'));
//repos
Get.lazyPut(() => PopularProductRepo(apiClient:Get.find() ));
//controllers
Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  return ;
}