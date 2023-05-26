import 'package:cosmatics_app/data/repository/cart_repo.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:get/get.dart';

import '../domain/models/cart.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, Cart> _items = {};
  Map<int ,Cart> get items=>_items;

  void addItem(Product product, int quantity) {
    if (_items.containsKey(product.id)) {
      //if key exists we just update it

      _items.update(product.id!, (value) {
        return Cart(
            id: value.id,
            name: value.name,
            price: int.tryParse(value.price.toString()),
            img: value.img,
            quantity: value.quantity!+quantity,//here we update and add the quantity to the previus one
            isExit: true,
            time: DateTime.now().toString());
      });
    } else {
      //else it's not there so we add it
      _items.putIfAbsent(product.id!, () {
  
        return Cart(
            id: product.id,
            name: product.name,
            price: int.tryParse(product.price.toString()),
            img: product.imageLink,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString());
      });
    }
  }
}
