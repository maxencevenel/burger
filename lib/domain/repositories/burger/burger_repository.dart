
import 'package:multiple_result/multiple_result.dart';
import 'package:useradgents_burger/core/errors/failure.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';

abstract class BurgerRepository {
  Future<Result<List<Burger>, Failure>> getBurgers();
}