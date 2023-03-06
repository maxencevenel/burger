import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:useradgents_burger/presentation/blocs/navigation/navigation_cubit.dart';

void main() {
  late NavigationCubit navigationCubit;

  setUp(() {
    navigationCubit = NavigationCubit();
  });

  test('Initial state is index 0', () {
    expect(navigationCubit.state, 0);
  });

  blocTest(
    'on update index to 2 emits 2',
    build: () => navigationCubit,
    act: (cubit) {
      cubit.updateIndex(2);
    },
    expect: () => [2],
  );

  blocTest(
    'on navigateToHome emits 0',
    build: () => navigationCubit,
    act: (cubit) {
      cubit.navigateToHomePage();
    },
    expect: () => [0],
  );

  blocTest(
    'on navigateToCart emits 2',
    build: () => navigationCubit,
    act: (cubit) {
      cubit.navigateToCart();
    },
    expect: () => [2],
  );
}
