import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:useradgents_burger/core/errors/exception.dart';
import 'package:useradgents_burger/core/errors/failure.dart';
import 'package:useradgents_burger/data/data_sources/data_sources.dart';
import 'package:useradgents_burger/data/repositories/burger/burger_repository_impl.dart';

import '../../../data_mocks.dart';
import 'burger_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkDataSource, BurgerRemoteDataSource])
void main() {
  late MockNetworkDataSource mockNetworkDataSource;
  late MockBurgerRemoteDataSource mockBurgerRemoteDataSource;
  late BurgerRepositoryImpl burgerRepositoryImpl;

  setUp(() {
    mockNetworkDataSource = MockNetworkDataSource();
    mockBurgerRemoteDataSource = MockBurgerRemoteDataSource();
    burgerRepositoryImpl = BurgerRepositoryImpl(
      burgerRemoteDataSource: mockBurgerRemoteDataSource,
      networkDataSource: mockNetworkDataSource,
    );
  });

  group('When online', () {
    setUp(() {
      when(mockNetworkDataSource.hasConnection).thenAnswer((_) async => true);
    });

    test('Should return Burger List when success', () async {
      when(mockBurgerRemoteDataSource.getBurgers())
          .thenAnswer((_) async => burgers);

      final result = await burgerRepositoryImpl.getBurgers();

      expect(result, const Success(burgers));
    });

    test('Should return ServerFailure when throw ServerException', () async {
      when(mockBurgerRemoteDataSource.getBurgers())
          .thenThrow(ServerException());

      final result = await burgerRepositoryImpl.getBurgers();

      expect(result, Error(ServerFailure()));
    });

    test('Should return UnknownFailure when throw UnknownException', () async {
      when(mockBurgerRemoteDataSource.getBurgers())
          .thenThrow(UnknownException());

      final result = await burgerRepositoryImpl.getBurgers();

      expect(result, Error(UnknownFailure()));
    });
  });

  group('When offline', () {
    setUp(() {
      when(mockNetworkDataSource.hasConnection).thenAnswer((_) async => false);
    });

    test('Should return NetworkFailure', () async {
      when(mockBurgerRemoteDataSource.getBurgers())
          .thenAnswer((_) async => burgers);

      final result = await burgerRepositoryImpl.getBurgers();

      expect(result, Error(NetworkFailure()));
    });
  });
}
