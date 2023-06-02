import 'package:cosmatics_app/pages/home/home_page.dart';
import 'package:cosmatics_app/pages/improved_product_details.dart';
import 'package:get/get.dart';

import '../domain/models/product.dart';
import '../pages/cart/cart_details.dart';
import '../pages/home/main_cosmatics_page.dart';

class RouteHelper{
  static const String initial='/';
  static const String productsDetails='/improved-product-details';
  static const String cartDetail='/cart-details';
  static const String mainCosPage='/main-cos-pag';


  static String getinitial()=>initial;
  static String getMainCosmaticPage()=>mainCosPage;
  static String getCartDetails()=>cartDetail;
  static String getPopularProducts(Product product)=>'$productsDetails?product=$product';

  static List<GetPage> route=[
    GetPage(name: initial, page:(() => const HomePage()),
    ) ,GetPage(name: mainCosPage, page:(() => const MainCosmaticPage()),
    ),  GetPage(name: cartDetail, page:(() => const CartDetails()),
    ),
    GetPage(name: productsDetails, page: () {
      Product product=Get.parameters['product'] as Product;
      return ImprovedProductDetails(product: product);
    },), GetPage(name: cartDetail, page: () {
      return CartDetails();
    },transition: Transition.native)
  ];
}