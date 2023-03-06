
import 'package:useradgents_burger/domain/entities/burger.dart';

abstract class BurgerRemoteDataSource {
  Future<List<Burger>> getBurgers();
}