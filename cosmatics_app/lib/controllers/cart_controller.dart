import 'package:cosmatics_app/data/repository/cart_repo.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:get/get.dart';

import '../domain/models/cart.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, Cart> _items = {};
  Map<int, Cart> get items => _items;

  void addItem(Product product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      //if key exists we just update it

      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! +
            quantity; //to remove the item from cart if the quantity is zero
        return Cart(
            id: value.id,
            name: value.name,
            price: int.tryParse(value.price.toString()),
            img: value.img,
            quantity: value.quantity! +
                quantity, //here we update and add the quantity to the previus one
            isExit: true,
            time: DateTime.now().toString());
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
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

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
}
