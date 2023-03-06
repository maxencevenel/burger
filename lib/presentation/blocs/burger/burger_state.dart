part of 'burger_bloc.dart';

class BurgerState extends Equatable {
  final List<Burger> burgers;
  final BlocStatus status;
  final Burger? selectedBurger;

  const BurgerState({
    this.burgers = const [],
    this.status = BlocStatus.init,
    this.selectedBurger,
  });

  BurgerState copyWith({
    List<Burger>? burgers,
    BlocStatus? status,
    Burger? selectedBurger,
  }) {
    return BurgerState(
      burgers: burgers ?? this.burgers,
      status: status ?? this.status,
      selectedBurger: selectedBurger ?? this.selectedBurger,
    );
  }

  @override
  List<Object?> get props => [burgers, status, selectedBurger];


}

