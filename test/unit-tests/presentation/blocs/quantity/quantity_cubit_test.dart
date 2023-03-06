

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:useradgents_burger/presentation/blocs/quantity/quantity_cubit.dart';

void main() {
  late QuantityCubit quantityCubit;

  setUp(() {
    quantityCubit = QuantityCubit();
  });

  test('Initial value is 0', () {
    expect(quantityCubit.state, 0);
  });

  blocTest(
    'on update quantity to 2 emits 2',
    build: () => quantityCubit,
    act: (cubit) {
      cubit.setQuantity(2);
    },
    expect: () => [2],
  );
}