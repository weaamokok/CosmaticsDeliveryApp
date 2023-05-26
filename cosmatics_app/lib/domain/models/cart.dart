// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cart {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExit;
  String? time;
  Cart({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExit,
    this.time,
  });

  Cart copyWith({
    int? id,
    String? name,
    int? price,
    String? img,
    int? quantity,
    bool? isExit,
    String? time,
  }) {
    return Cart(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      img: img ?? this.img,
      quantity: quantity ?? this.quantity,
      isExit: isExit ?? this.isExit,
      time: time ?? this.time,
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
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      img: map['img'] != null ? map['img'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      isExit: map['isExit'] != null ? map['isExit'] as bool : null,
      time: map['time'] != null ? map['time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(id: $id, name: $name, price: $price, img: $img, quantity: $quantity, isExit: $isExit, time: $time)';
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
      other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      img.hashCode ^
      quantity.hashCode ^
      isExit.hashCode ^
      time.hashCode;
  }
}
