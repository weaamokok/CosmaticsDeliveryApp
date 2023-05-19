// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  String? country;
  String? city;
  Address({
    this.country,
    this.city,
  });

  Address copyWith({
    String? country,
    String? city,
  }) {
    return Address(
      country: country ?? this.country,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'city': city,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Address(country: $country, city: $city)';

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.country == country &&
      other.city == city;
  }

  @override
  int get hashCode => country.hashCode ^ city.hashCode;
}
