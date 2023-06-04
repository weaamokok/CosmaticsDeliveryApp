import 'package:cosmatics_app/data/repository/cart_repo.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:get/get.dart';

import '../domain/models/cart.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, Cart> _items = {};
  Map<int, Cart> get items => _items;//temp
//that is stored in the memory
List<Cart> storageItems=[];


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
            price: value.price,
            img: value.img,
            quantity: value.quantity! +
                quantity, //here we update and add the quantity to the previus one
            isExit: true,
            time: DateTime.now().toString(),product: product);

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
            price: double.tryParse(product.price.toString()),
            img: product.imageLink,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),product: product);
      });
    }
    cartRepo.addToCartList(getCartItems);
    update();
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<Cart> get getCartItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  double get totalAmount{
    var total =0.0;
    _items.forEach((key, value) {total+=value.quantity!*value.price!; });
    return total;

  }
List<Cart> getCartData(){
  setCart=cartRepo.getCartList();//setting the cart 
  print('عد المخزن'+'${storageItems.length}');
  return storageItems;
}
set setCart(List<Cart> items){

  storageItems=items;
for(int i=0;i<storageItems.length;i++){
  
  _items.putIfAbsent(storageItems[i].id as int, () => storageItems[i]);
}}
}
