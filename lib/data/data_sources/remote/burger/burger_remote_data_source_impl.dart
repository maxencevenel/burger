import 'package:dio/dio.dart';
import 'package:useradgents_burger/core/errors/exception.dart';
import 'package:useradgents_burger/data/data_sources/data_sources.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';

class BurgerRemoteDataSourceImpl implements BurgerRemoteDataSource {
  final Dio _dio;

  const BurgerRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<List<Burger>> getBurgers() async {
    try {
      final response = await _dio.get("/bigburger");

      var result =
      (response.data as List).map((e) => Burger.fromMap(e)).toList();

      return result;
    }on DioError catch (e) {
      switch (e.response?.statusCode) {
        // todo: add error status code
        default:
          throw ServerException();
      }
    } catch (e) {
      throw UnknownException();
    }
  }
}
