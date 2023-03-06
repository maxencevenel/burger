import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';
import 'package:useradgents_burger/domain/entities/order.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddOrderEvent>(_onAddOrder);
    on<UpdateQuantityOrderEvent>(_onUpdateQuantityOrder);
  }

  FutureOr<void> _onAddOrder(AddOrderEvent event, Emitter<CartState> emit) {
    final order = Order(burger: event.burger, quantity: event.quantity);

    emit(state.copyWith(orders: [...state.orders, order]));
  }

  FutureOr<void> _onUpdateQuantityOrder(UpdateQuantityOrderEvent event, Emitter<CartState> emit) {
    final orders = state.orders.map((order) {
      if (order.burger.ref == event.burgerRef) {
        return order.copyWith(quantity: event.newQuantity);
      } else {
        return order;
      }
    }).toList();

    emit(state.copyWith(orders: orders));
  }
}
