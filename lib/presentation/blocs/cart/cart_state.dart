part of 'cart_bloc.dart';


class CartState extends Equatable {

  final List<Order> orders;

  double get total => orders.fold(0.0, (total, order) => total + order.price);

  const CartState({
    this.orders = const [],
  });

  CartState copyWith({
    List<Order>? orders,
  }) {
    return CartState(
      orders: orders ?? this.orders,
    );
  }


  @override
  List<Object> get props => [orders];
}

