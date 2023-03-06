part of 'burger_bloc.dart';

class BurgerState extends Equatable {
  final List<Burger> burgers;
  final BlocStatus status;

  const BurgerState({
    this.burgers = const [],
    this.status = BlocStatus.init,
  });

  BurgerState copyWith({
    List<Burger>? burgers,
    BlocStatus? status,
  }) {
    return BurgerState(
      burgers: burgers ?? this.burgers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [burgers, status];


}

