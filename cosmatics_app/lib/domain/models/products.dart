import 'package:cosmatics_app/domain/models/product.dart';

class Products {
  
  late List<Product> _products;
  List<Product> get products => _products;
  Products(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    
    _products = products;
  }
  Products.fromJson(Map<String, dynamic> json) {
 
   
      _products = <Product>[];
      json[0].forEach((v) {
        _products.add(Product.fromJson(v));
      });
    
  }
}
