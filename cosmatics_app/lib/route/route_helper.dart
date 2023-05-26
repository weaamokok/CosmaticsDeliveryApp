import 'package:cosmatics_app/pages/improved_product_details.dart';
import 'package:get/get.dart';

import '../domain/models/product.dart';
import '../pages/Brands/brand_products.dart';
import '../pages/home/main_cosmatics_page.dart';

class RouteHelper{
  static const String initial='/';
  static const String productsDetails='/improved-product-details';

  static String getinitial()=>'$initial';
  static String getPopularProducts(Product product)=>'$productsDetails?product=$product';

  static List<GetPage> route=[
    GetPage(name: initial, page:(() => MainCosmaticPage()),
    ),
    GetPage(name: productsDetails, page: () {
      Product product=Get.parameters['product'] as Product;
      return ImprovedProductDetails(product: product);
    },)
  ];
}