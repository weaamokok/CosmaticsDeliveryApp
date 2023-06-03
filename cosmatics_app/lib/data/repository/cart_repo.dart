import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/cart.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart=[];
  void addToCartList(Cart cart){
    
  }
}