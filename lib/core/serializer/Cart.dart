// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cart {
  int cart_id;
  int cart_user;
  int cart_item;
  int cart_quantity;
  int cart_count;
  Cart({
    required this.cart_id,
    required this.cart_user,
    required this.cart_item,
    required this.cart_quantity,
    required this.cart_count,
  });

  Cart copyWith({
    int? cart_id,
    int? cart_user,
    int? cart_item,
    int? cart_quantity,
    int? cart_count,
  }) {
    return Cart(
      cart_id: cart_id ?? this.cart_id,
      cart_user: cart_user ?? this.cart_user,
      cart_item: cart_item ?? this.cart_item,
      cart_quantity: cart_quantity ?? this.cart_quantity,
      cart_count: cart_count ?? this.cart_count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart_id': cart_id,
      'cart_user': cart_user,
      'cart_item': cart_item,
      'cart_quantity': cart_quantity,
      'cart_count': cart_count,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      cart_id: map['cart_id'] as int,
      cart_user: map['cart_user'] as int,
      cart_item: map['cart_item'] as int,
      cart_quantity: map['cart_quantity'] as int,
      cart_count: map['cart_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(cart_id: $cart_id, cart_user: $cart_user, cart_item: $cart_item, cart_quantity: $cart_quantity, cart_count: $cart_count)';
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;
  
    return 
      other.cart_id == cart_id &&
      other.cart_user == cart_user &&
      other.cart_item == cart_item &&
      other.cart_quantity == cart_quantity &&
      other.cart_count == cart_count;
  }

  @override
  int get hashCode {
    return cart_id.hashCode ^
      cart_user.hashCode ^
      cart_item.hashCode ^
      cart_quantity.hashCode ^
      cart_count.hashCode;
  }
}
