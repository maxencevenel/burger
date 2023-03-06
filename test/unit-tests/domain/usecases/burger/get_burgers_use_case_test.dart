import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:useradgents_burger/domain/repositories/burger/burger_repository.dart';
import 'package:useradgents_burger/domain/usecases/burger/get_burgers_usecase.dart';

import '../../../data_mocks.dart';
import 'get_burgers_use_case_test.mocks.dart';

@GenerateMocks([BurgerRepository])
void main() {
  late MockBurgerRepository mockBurgerRepository;
  late GetBurgersUseCase getBurgerUseCase;

  setUp(() {
    mockBurgerRepository = MockBurgerRepository();
    getBurgerUseCase = GetBurgersUseCase(burgerRepository: mockBurgerRepository);
  });

  test('Should return Success(List<Burger>) when success', () async {
    when(mockBurgerRepository.getBurgers())
        .thenAnswer((_) async => const Success(burgers));

    final result = await getBurgerUseCase();

    expect(result, const Success(burgers));
  });
}
