part of 'burger_bloc.dart';

abstract class BurgerEvent extends Equatable {
  const BurgerEvent();

  @override
  List<Object> get props => [];
}

class GetBurgersEvent extends BurgerEvent {}

class GetBurgerByIdEvent extends BurgerEvent {
  final String ref;

  const GetBurgerByIdEvent({required this.ref});

  @override
  List<Object> get props => [ref];
}
