
import 'package:cosmatics_app/helper/curent_user.dart';
import 'package:cosmatics_app/pages/auth_pages/login_page.dart';
import 'package:cosmatics_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/brands_controller.dart';
import '../controllers/cart_controller.dart';
import '../controllers/popular_products_controller.dart';
import '../controllers/top_sale_controllers.dart';

class redirectUser extends StatefulWidget {
  const redirectUser({super.key});

  @override
  State<redirectUser> createState() => _redirectUserState();
}
Future<void> redirect()async{
   _loadResource();
final SharedPreferences shared=await SharedPreferences.getInstance();
shared.containsKey('userId')?{
  currentUser. currentUserID=shared.getString('userId'),
  Get.to(() => HomePage())}:Get.to(()=>const HomePage());

}
_loadResource()async{
  await  Get.find<BrandsController>().getBrands();
   await Get.find<TopSaleProductController>().getTopSaleProductList();
  await  Get.find<PopularProductController>().getPopularProductList();
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());

}


class _redirectUserState extends State<redirectUser> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    redirect();

  }
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}