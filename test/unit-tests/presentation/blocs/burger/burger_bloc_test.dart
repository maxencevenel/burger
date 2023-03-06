import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:useradgents_burger/core/errors/failure.dart';
import 'package:useradgents_burger/core/helpers/enums/bloc_status.dart';
import 'package:useradgents_burger/domain/usecases/burger/get_burgers_usecase.dart';
import 'package:useradgents_burger/presentation/blocs/burger/burger_bloc.dart';

import '../../../data_mocks.dart';
import 'burger_bloc_test.mocks.dart';

@GenerateMocks([GetBurgersUseCase])
void main() {
  late MockGetBurgersUseCase mockGetBurgersUseCase;
  late BurgerBloc burgerBloc;

  setUp(() {
    mockGetBurgersUseCase = MockGetBurgersUseCase();
    burgerBloc = BurgerBloc(getBurgersUseCase: mockGetBurgersUseCase);
  });

  test('Initial state is BurgerState', () {
    expect(burgerBloc.state, const BurgerState());
  });

  blocTest(
    'GetBurgersEvent return BurgerState with success status and burger list when success',
    setUp: () {
      when(mockGetBurgersUseCase())
          .thenAnswer((_) async => const Success(burgers));
    },
    build: () => burgerBloc,
    act: (bloc) {
      bloc.add(GetBurgersEvent());
    },
    expect: () => [
      const BurgerState(status: BlocStatus.loading),
      const BurgerState(status: BlocStatus.success, burgers: burgers),
    ],
  );

  blocTest(
    'GetBurgersEvent return BurgerState with status error when error occurred',
    setUp: () {
      when(mockGetBurgersUseCase())
          .thenAnswer((_) async => Error(ServerFailure()));
    },
    build: () => burgerBloc,
    act: (bloc) {
      bloc.add(GetBurgersEvent());
    },
    expect: () => [
      const BurgerState(status: BlocStatus.loading),
      const BurgerState(status: BlocStatus.error),
    ],
  );
}
