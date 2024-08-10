// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class items {
  String item_name;
  String item_desc;
  String item_image;
  int item_count;
  bool item_active;
  int item_price;
  int item_discount;
  int item_cat;
  items({
    required this.item_name,
    required this.item_desc,
    required this.item_image,
    required this.item_count,
    required this.item_active,
    required this.item_price,
    required this.item_discount,
    required this.item_cat,
  });

  items copyWith({
    String? item_name,
    String? item_desc,
    String? item_image,
    int? item_count,
    bool? item_active,
    int? item_price,
    int? item_discount,
    int? item_cat,
  }) {
    return items(
      item_name: item_name ?? this.item_name,
      item_desc: item_desc ?? this.item_desc,
      item_image: item_image ?? this.item_image,
      item_count: item_count ?? this.item_count,
      item_active: item_active ?? this.item_active,
      item_price: item_price ?? this.item_price,
      item_discount: item_discount ?? this.item_discount,
      item_cat: item_cat ?? this.item_cat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'item_name': item_name,
      'item_desc': item_desc,
      'item_image': item_image,
      'item_count': item_count,
      'item_active': item_active,
      'item_price': item_price,
      'item_discount': item_discount,
      'item_cat': item_cat,
    };
  }

  factory items.fromMap(Map<String, dynamic> map) {
    return items(
      item_name: map['item_name'] as String,
      item_desc: map['item_desc'] as String,
      item_image: map['item_image'] as String,
      item_count: map['item_count'] as int,
      item_active: map['item_active'] as bool,
      item_price: map['item_price'] as int,
      item_discount: map['item_discount'] as int,
      item_cat: map['item_cat'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory items.fromJson(String source) => items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'items(item_name: $item_name, item_desc: $item_desc, item_image: $item_image, item_count: $item_count, item_active: $item_active, item_price: $item_price, item_discount: $item_discount, item_cat: $item_cat)';
  }

  @override
  bool operator ==(covariant items other) {
    if (identical(this, other)) return true;
  
    return 
      other.item_name == item_name &&
      other.item_desc == item_desc &&
      other.item_image == item_image &&
      other.item_count == item_count &&
      other.item_active == item_active &&
      other.item_price == item_price &&
      other.item_discount == item_discount &&
      other.item_cat == item_cat;
  }

  @override
  int get hashCode {
    return item_name.hashCode ^
      item_desc.hashCode ^
      item_image.hashCode ^
      item_count.hashCode ^
      item_active.hashCode ^
      item_price.hashCode ^
      item_discount.hashCode ^
      item_cat.hashCode;
  }
}
