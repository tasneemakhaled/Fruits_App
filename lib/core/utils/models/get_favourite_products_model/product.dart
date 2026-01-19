import 'sub_unit.dart';

class Product {
  int? id;
  String? name;
  String? unit;
  String? unitEn;
  String? nameEn;
  int? discount;
  int? categoryId;
  int? quantity;
  int? price;
  String? img;
  String? details;
  String? detailsEn;
  List<dynamic>? attributes;
  String? nameCategory;
  String? nameCategoryEn;
  List<dynamic>? productAttributesValues;
  List<SubUnit>? subUnits;

  Product({
    this.id,
    this.name,
    this.unit,
    this.unitEn,
    this.nameEn,
    this.discount,
    this.categoryId,
    this.quantity,
    this.price,
    this.img,
    this.details,
    this.detailsEn,
    this.attributes,
    this.nameCategory,
    this.nameCategoryEn,
    this.productAttributesValues,
    this.subUnits,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    unit: json['unit'] as String?,
    unitEn: json['unit_en'] as String?,
    nameEn: json['name_en'] as String?,
    discount: json['discount'] as int?,
    categoryId: json['category_id'] as int?,
    quantity: json['quantity'] as int?,
    price: json['price'] as int?,
    img: json['img'] as String?,
    details: json['details'] as String?,
    detailsEn: json['details_en'] as String?,
    attributes: json['attributes'] as List<dynamic>?,
    nameCategory: json['name_category'] as String?,
    nameCategoryEn: json['name_category_en'] as String?,
    productAttributesValues:
        json['product_attributes_values'] as List<dynamic>?,
    subUnits: (json['sub_units'] as List<dynamic>?)
        ?.map((e) => SubUnit.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'unit': unit,
    'unit_en': unitEn,
    'name_en': nameEn,
    'discount': discount,
    'category_id': categoryId,
    'quantity': quantity,
    'price': price,
    'img': img,
    'details': details,
    'details_en': detailsEn,
    'attributes': attributes,
    'name_category': nameCategory,
    'name_category_en': nameCategoryEn,
    'product_attributes_values': productAttributesValues,
    'sub_units': subUnits?.map((e) => e.toJson()).toList(),
  };
}
