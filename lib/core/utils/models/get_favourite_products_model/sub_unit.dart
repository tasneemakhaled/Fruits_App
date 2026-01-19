class SubUnit {
  int? id;
  int? productId;
  int? unitId;
  String? subUnit;
  String? subUnitEn;
  int? subQuantity;
  int? subPrice;
  int? subDiscount;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  SubUnit({
    this.id,
    this.productId,
    this.unitId,
    this.subUnit,
    this.subUnitEn,
    this.subQuantity,
    this.subPrice,
    this.subDiscount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory SubUnit.fromJson(Map<String, dynamic> json) => SubUnit(
    id: json['id'] as int?,
    productId: json['product_id'] as int?,
    unitId: json['unit_id'] as int?,
    subUnit: json['sub_unit'] as String?,
    subUnitEn: json['sub_unit_en'] as String?,
    subQuantity: json['sub_quantity'] as int?,
    subPrice: json['sub_price'] as int?,
    subDiscount: json['sub_discount'] as int?,
    createdAt: json['created_at'] as dynamic,
    updatedAt: json['updated_at'] as dynamic,
    deletedAt: json['deleted_at'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'product_id': productId,
    'unit_id': unitId,
    'sub_unit': subUnit,
    'sub_unit_en': subUnitEn,
    'sub_quantity': subQuantity,
    'sub_price': subPrice,
    'sub_discount': subDiscount,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'deleted_at': deletedAt,
  };
}
