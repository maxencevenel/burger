part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddOrderEvent extends CartEvent {
  final Burger burger;
  final int quantity;

  const AddOrderEvent({
    required this.burger,
    required this.quantity,
  });

  @override
  List<Object> get props => [burger, quantity];
}


class UpdateQuantityOrderEvent extends CartEvent {
  final String burgerRef;
  final int newQuantity;

  const UpdateQuantityOrderEvent({
    required this.burgerRef,
    required this.newQuantity,
  });

  @override
  List<Object> get props => [burgerRef, newQuantity];
}