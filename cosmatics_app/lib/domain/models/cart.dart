// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cosmatics_app/domain/models/product.dart';

class Cart {
  int? id;
  String? name;
  double? price;
  String? img;
  int? quantity;
  bool? isExit;
  String? time;
  Product? product;
  Cart({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExit,
    this.time,
    this.product
  });

  Cart copyWith({
    int? id,
    String? name,
    double? price,
    String? img,
    int? quantity,
    bool? isExit,
    String? time,
      Product? product

  }) {
    return Cart(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      img: img ?? this.img,
      quantity: quantity ?? this.quantity,
      isExit: isExit ?? this.isExit,
      time: time ?? this.time,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'img': img,
      'quantity': quantity,
      'isExit': isExit,
      'time': time,
      'product':product
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      img: map['img'] != null ? map['img'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      isExit: map['isExit'] != null ? map['isExit'] as bool : null,
      time: map['time'] != null ? map['time'] as String : null,
      product: map['product'] != null ? map['product'] as Product : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(id: $id, name: $name, price: $price, img: $img, quantity: $quantity, isExit: $isExit, time: $time,product: $product)';
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.img == img &&
      other.quantity == quantity &&
      other.isExit == isExit &&
      other.time == time&&
      other.product == product;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      img.hashCode ^
      quantity.hashCode ^
      isExit.hashCode ^
      time.hashCode^
      product.hashCode;
  }
}
