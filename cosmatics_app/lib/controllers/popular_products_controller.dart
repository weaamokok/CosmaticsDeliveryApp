import 'package:cosmatics_app/controllers/cart_controller.dart';
import 'package:cosmatics_app/data/repository/popular_products_repo.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/models/cart.dart';


class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  int quantity = 0;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      response.body.forEach((v) {
        _popularProductList.add(Product.fromJson(v));
      });

      update();
    } else {}
  }

  //quantity controlling
  void setQuantitiy(bool isIncrement) {
    if (isIncrement) {
      quantity = checkQuantitiy(quantity + 1);
    } else {
      quantity = checkQuantitiy(quantity - 1);
    }
    update();
  }

//checks the Quantity
  int checkQuantitiy(int quantity) {
    if (quantity < 0) {
      Get.snackbar('الكمية المختارة', 'لايمكن تقليل العددها أكثر',
          backgroundColor: blueush,
          colorText: Colors.white,
          animationDuration: const Duration(milliseconds: 50),
          isDismissible: true,
          duration: const Duration(milliseconds: 800));
      return 0;
    } else if (quantity > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    quantity = 0;
    _inCartItems = 0;
    _cart = cart;
//get from storage to _inCartItems
    update();
  }

  void addItem(Product product) {
    if (quantity > 0) {
      _cart.addItem(product, quantity);
      quantity=0;//so it doesn't mess the quantity in overall
     
    } else {

  
      Get.snackbar('الكمية المضافة', 'يجب إضافة صنف على الاقل',
          backgroundColor: blueush,
          colorText: Colors.white,
          animationDuration: const Duration(milliseconds: 50),
          isDismissible: true,
          duration: const Duration(milliseconds: 800));

    }
    update();
  }
int get totalItems{
  return _cart.totalItems;
}
List<Cart> get getCartItems{
  return _cart.getCartItems;
}
}
