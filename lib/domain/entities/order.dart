import 'package:equatable/equatable.dart';

import 'burger.dart';

class Order extends Equatable {
  final Burger burger;
  final int quantity;

  double get price => burger.priceInEuro * quantity;

  const Order({
    required this.burger,
    required this.quantity,
  });

  Order copyWith({
    Burger? burger,
    int? quantity,
  }) {
    return Order(
      burger: burger ?? this.burger,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [burger, quantity];


}