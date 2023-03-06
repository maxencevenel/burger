import 'package:multiple_result/multiple_result.dart';
import 'package:useradgents_burger/core/errors/exception.dart';
import 'package:useradgents_burger/core/errors/failure.dart';
import 'package:useradgents_burger/data/data_sources/data_sources.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';
import 'package:useradgents_burger/domain/repositories/burger/burger_repository.dart';

class BurgerRepositoryImpl implements BurgerRepository {
  final BurgerRemoteDataSource _burgerRemoteDataSource;
  final NetworkDataSource _networkDataSource;

  const BurgerRepositoryImpl({
    required BurgerRemoteDataSource burgerRemoteDataSource,
    required NetworkDataSource networkDataSource,
  })  : _burgerRemoteDataSource = burgerRemoteDataSource,
        _networkDataSource = networkDataSource;

  @override
  Future<Result<List<Burger>, Failure>> getBurgers() async {
    final hasConnection = await _networkDataSource.hasConnection;
    if (hasConnection) {
      try {
        var result = await _burgerRemoteDataSource.getBurgers();

        return Success(result);
      } on ServerException {
        return Error(ServerFailure());
      } on UnknownException {
        return Error(UnknownFailure());
      }
    }
    return Error(NetworkFailure());
  }
}
