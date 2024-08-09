// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class category {
  int cat_id;
  String cat_name;
  category({
    required this.cat_id,
    required this.cat_name,
  });

  category copyWith({
    int? cat_id,
    String? cat_name,
  }) {
    return category(
      cat_id: cat_id ?? this.cat_id,
      cat_name: cat_name ?? this.cat_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cat_id': cat_id,
      'cat_name': cat_name,
    };
  }

  factory category.fromMap(Map<String, dynamic> map) {
    return category(
      cat_id: map['cat_id'] as int,
      cat_name: map['cat_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory category.fromJson(String source) => category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'category(cat_id: $cat_id, cat_name: $cat_name)';

  @override
  bool operator ==(covariant category other) {
    if (identical(this, other)) return true;
  
    return 
      other.cat_id == cat_id &&
      other.cat_name == cat_name;
  }

  @override
  int get hashCode => cat_id.hashCode ^ cat_name.hashCode;
}
