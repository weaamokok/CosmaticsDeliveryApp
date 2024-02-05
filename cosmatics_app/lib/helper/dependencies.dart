import 'package:cosmatics_app/controllers/auth_controller.dart';
import 'package:cosmatics_app/controllers/brands_controller.dart';
import 'package:cosmatics_app/controllers/cart_controller.dart';
import 'package:cosmatics_app/controllers/popular_products_controller.dart';
import 'package:cosmatics_app/controllers/top_sale_controllers.dart';
import 'package:cosmatics_app/data/api/api_client.dart';
import 'package:cosmatics_app/data/remote_service/products_remote_service.dart';
import 'package:cosmatics_app/data/repository/auth_repo.dart';
import 'package:cosmatics_app/data/repository/brands_repo.dart';
import 'package:cosmatics_app/data/repository/brands_repository.dart';
import 'package:cosmatics_app/data/repository/cart_repo.dart';
import 'package:cosmatics_app/data/repository/popular_products_repo.dart';
import 'package:cosmatics_app/data/repository/user_repo.dart';
import 'package:cosmatics_app/helper/dio_config.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/top_sale_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

//we give it to the get
  Get.lazyPut(() => sharedPreferences);

  DioConfig dioConfig = DioConfig();
  Dio dio = dioConfig.dio;
  Get.put<Dio>(dio);
  Get.lazyPut<ProductsRepository>(() => ProductsRepositoryImp(
      productsRemoteServiceApi: ProductsRemoteServiceApi(dio)));
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => TopSaleProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => BrandRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));
//controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => TopSaleProductController(topSaleProductRepo: Get.find()));
  Get.lazyPut(() =>
      BrandsController(brandsRepo: Get.find(), productsRepository: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  return;
}
