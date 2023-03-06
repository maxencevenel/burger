import 'package:multiple_result/multiple_result.dart';
import 'package:useradgents_burger/core/errors/failure.dart';
import 'package:useradgents_burger/core/helpers/generics/params.dart';
import 'package:useradgents_burger/core/helpers/generics/usecase.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';
import 'package:useradgents_burger/domain/repositories/repositories.dart';

class GetBurgersUseCase extends UseCase<List<Burger>, NoParam> {
  final BurgerRepository _burgerRepository;

  GetBurgersUseCase({
    required BurgerRepository burgerRepository,
  }) : _burgerRepository = burgerRepository;

  @override
  Future<Result<List<Burger>, Failure>> call({NoParam? param}) {
    return _burgerRepository.getBurgers();
  }
}
