import 'dart:convert';

import 'package:cosmatics_app/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/cart.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart=[];
  void addToCartList(List<Cart> cartList){
    cart=[];//make sure it's empty
    cartList.forEach((element) { 
      print(' عنصر الليستة ${element}');
      cart.add(jsonEncode(element));//converting cart to string cua sharedprefernces accepsts only string

    });
    sharedPreferences.setStringList(AppConstants. CART_LIST, cart);
  }
  List<Cart> getCartList(){
    List<String> carts=[];
        List<Cart> cartList=[];

   if( sharedPreferences.containsKey(AppConstants.CART_LIST)){
    carts=sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    print(' من الشير${carts.toString()}');
    carts.forEach((element) { 
      cartList.add(Cart.fromJson(jsonDecode(element)));
    });
   }
    

    return cartList;
  }
}