
class Product {
  int? id;
  String? brand;
  String? name;
  String? price;
  String? priceSign;
  String? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? category;
  String? productType;
  List<String>? tagList;
  String? createdAt;
  String? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColors>? productColors;

  Product(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.priceSign,
      this.currency,
      this.imageLink,
      this.productLink,
      this.websiteLink,
      this.description,
      this.rating,
      this.category,
      this.productType,
      this.tagList,
      this.createdAt,
      this.updatedAt,
      this.productApiUrl,
      this.apiFeaturedImage,
      this.productColors});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    priceSign = json['price_sign'];
    currency = json['currency'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'];
    category = json['category'];
    productType = json['product_type'];
    tagList = json['tag_list'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
    if (json['product_colors'] != null) {
      productColors = <ProductColors>[];
      json['product_colors'].forEach((v) {
        productColors!.add( ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand;
    data['name'] = name;
    data['price'] = price;
    data['price_sign'] = priceSign;
    data['currency'] = currency;
    data['image_link'] = imageLink;
    data['product_link'] = productLink;
    data['website_link'] = websiteLink;
    data['description'] = description;
    data['rating'] = rating;
    data['category'] = category;
    data['product_type'] = productType;
    data['tag_list'] = tagList;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['product_api_url'] = productApiUrl;
    data['api_featured_image'] = apiFeaturedImage;
    if (productColors != null) {
      data['product_colors'] =
          productColors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
     'id':id,
   'brand':brand,
 'name':name,
   'price':price,
   'priceSign':priceSign,
   'currency':currency,
  'imageLink':imageLink,
 'productLink':productLink,
  'websiteLink':websiteLink,
   'description':description,
 'rating':rating,
 'category':category,
 'productType':productType,
 'tagList':tagList,
 'createdAt':createdAt,
  'updatedAt':updatedAt,
 'productApiUrl':productApiUrl,
  'apiFeaturedImage':apiFeaturedImage,
  'productColors':productColors
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      imageLink: map['imageLink'] != null ? map['imageLink'] as String : null,
      apiFeaturedImage: map['apiFeaturedImage'] != null ? map['apiFeaturedImage'] as String : null,
      brand: map['brand'] != null ? map['brand'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      priceSign: map['priceSign'] != null ? map['priceSign'] as String : null,
      productApiUrl: map['productApiUrl'] != null ? map['productApiUrl'] as String : null,
      productLink: map['productLink'] != null ? map['productLink'] as String : null,
      productType: map['productType'] != null ? map['productType'] as String : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      websiteLink: map['websiteLink'] != null ? map['websiteLink'] as String : null,
      tagList: map['tagList'] != null ? map['tagList'] as List<String> : null,
      productColors: map['productColors'] != null ? map['productColors'] as List<ProductColors> : null,
    );
  }

}

class ProductColors {
  String? hexValue;
  String? colourName;

  ProductColors({this.hexValue, this.colourName});

  ProductColors.fromJson(Map<String, dynamic> json) {
    hexValue = json['hex_value'];
    colourName = json['colour_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hex_value'] = hexValue;
    data['colour_name'] = colourName;
    return data;
  }
}
