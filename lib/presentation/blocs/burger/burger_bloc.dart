import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:useradgents_burger/core/helpers/enums/bloc_status.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';
import 'package:useradgents_burger/domain/usecases/burger/get_burgers_usecase.dart';

part 'burger_event.dart';

part 'burger_state.dart';

class BurgerBloc extends Bloc<BurgerEvent, BurgerState> {
  final GetBurgersUseCase getBurgersUseCase;

  BurgerBloc({required this.getBurgersUseCase}) : super(const BurgerState()) {
    on<GetBurgersEvent>(_onGetBurgers);
  }

  FutureOr<void> _onGetBurgers(
      GetBurgersEvent event, Emitter<BurgerState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    var result = await getBurgersUseCase();
    
    result.when(
      (success) => emit(state.copyWith(
        status: BlocStatus.success,
        burgers: success,
      )),
      (error) => emit(state.copyWith(
        status: BlocStatus.error,
      )),
    );
  }
}
