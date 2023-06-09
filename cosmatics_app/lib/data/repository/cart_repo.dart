import 'dart:convert';

import 'package:cosmatics_app/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/cart.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart = [];
  List<String> cartHistory = [];
  void addToCartList(List<Cart> cartList) {
var time=DateTime.now().toString();
    cart = []; //make sure it's empty
  // sharedPreferences.remove(AppConstants.CART_LIST);
   // sharedPreferences.remove(AppConstants.CART_LIST_HISTORY);
    cartList.forEach((element) {
      //this line is recalled everytime we add product to cart so it updates the time for all products to be the same each time we add
element.time=time;
     // print(' عنصر الليستة ${element}');
    return  cart.add(jsonEncode(
          element)); //converting cart to string cua sharedprefernces accepsts only string
    });
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
  }

  List<Cart> getCartList() {
    List<String> carts = [];
    List<Cart> cartList = [];

    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print(' من الشير${carts.toString()}');
      carts.forEach((element) {
        cartList.add(Cart.fromJson(jsonDecode(element)));
      });
    }

    return cartList;
  }
//نجيبو بيها العناصر من الي درنالهم تشك اوت من الشير بريفرينس
  List<Cart> getCartHistoyList(){
    if(sharedPreferences.containsKey(AppConstants.CART_LIST_HISTORY)){
      cartHistory=[];
      cartHistory=sharedPreferences.getStringList(AppConstants.CART_LIST_HISTORY)!;
    }
    //هنا درنا كونفرت باش نقدرو نعرضوهم ككارت
    List<Cart> cartListHistory=[];
    cartHistory.forEach((element) { cartListHistory.add(Cart.fromJson(jsonDecode(element)));});
    return cartListHistory;
  }

  void addToCartHistoryList() {
        if(sharedPreferences.containsKey(AppConstants.CART_LIST_HISTORY)){
          cartHistory=sharedPreferences.getStringList(AppConstants.CART_LIST_HISTORY)!;
        }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
     
    }
    removeCart();
     sharedPreferences.setStringList(
          AppConstants.CART_LIST_HISTORY, cartHistory);

  }
  void removeCart(){
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
