

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:useradgents_burger/presentation/blocs/cart/cart_bloc.dart';

import '../../../data_mocks.dart';

void main() {

  late CartBloc cartBloc;

  setUp(() {
    cartBloc = CartBloc();
  });

  test('Initial state is CartState', () {
    expect(cartBloc.state, const CartState());
  });

  blocTest(
    'AddOrderEvent return CartState with new order',
    build: () => cartBloc,
    act: (bloc) {
      bloc.add(const AddOrderEvent(burger: burger1, quantity: 2));
    },
    expect: () => [
      const CartState(orders: [order1]),
    ],
  );

  blocTest(
    'UpdateQuantityOrderEvent return CartState with new order quantity',
    build: () => cartBloc,
    act: (bloc) {
      bloc.add(const AddOrderEvent(burger: burger1, quantity: 2));
      bloc.add(UpdateQuantityOrderEvent(burgerRef: burger1.ref, newQuantity: 4));
    },
    expect: () => [
      const CartState(orders: [order1]),
      const CartState(orders: [order2]),
    ],
  );
}