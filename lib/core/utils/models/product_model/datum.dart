class Datum {
  int? id;
  String? name;
  String? nameEn;
  String? details;
  String? detailsEn;
  double? price;
  int? quantity;

  Datum({
    this.id,
    this.name,
    this.nameEn,
    this.details,
    this.detailsEn,
    this.price,
    this.quantity,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    name: json['name'] as String?,
    nameEn: json['name_en'] as String?,
    details: json['details'] as String?,
    detailsEn: json['details_en'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    quantity: json['quantity'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'name_en': nameEn,
    'details': details,
    'details_en': detailsEn,
    'price': price,
    'quantity': quantity,
  };
}
