// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:cosmatics_app/domain/models/address.dart';

class Person {
  String? name;
  int? age;
  String? city;
List<Address>? address;
  Person({
    this.name,
    this.age,
    this.city,
    this.address,
  });


  Person copyWith({
    String? name,
    int? age,
    String? city,
    List<Address>? address,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      city: city ?? this.city,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'city': city,
      'address': address!.map((x) => x.toMap()).toList(),
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] != null ? map['name'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      city: map['city'] != null ? map['city'] as String : null,
      address: map['address'] != null ? List<Address>.from((map['address'] as List<int>).map<Address?>((x) => Address.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Person(name: $name, age: $age, city: $city, address: $address)';
  }

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.name == name &&
      other.age == age &&
      other.city == city &&
      listEquals(other.address, address);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      age.hashCode ^
      city.hashCode ^
      address.hashCode;
  }
}
