import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:useradgents_burger/core/errors/exception.dart';
import 'package:useradgents_burger/data/data_sources/remote/burger/burger_remote_data_source_impl.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';

import '../../../../data_mocks.dart';
import 'burger_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([DioAdapter])
void main() {
  late Dio dio;
  late MockDioAdapter mockDioAdapter;
  late BurgerRemoteDataSourceImpl burgerRemoteDataSourceImpl;

  setUp(() {
    dio = Dio();
    mockDioAdapter = MockDioAdapter();
    dio.httpClientAdapter = mockDioAdapter;
    burgerRemoteDataSourceImpl = BurgerRemoteDataSourceImpl(dio: dio);
  });

  final httpResponse = ResponseBody.fromString(
    responseGetBurgersJson.toString(),
    200,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );

  final List<Burger> burgers = (jsonDecode(responseGetBurgersJson) as List)
      .map((burger) => Burger.fromMap(burger))
      .toList();

  test('Should return List<Burger> when Success', () async {
    when(mockDioAdapter.fetch(any, any, any))
        .thenAnswer((_) async => httpResponse);

    final result = await burgerRemoteDataSourceImpl.getBurgers();

    expect(result, burgers);
  });

  test('Should throw ServerException when StatusCode != success', () async {
    when(mockDioAdapter.fetch(any, any, any)).thenAnswer(
        (_) async => ResponseBody.fromString("Internal Server error", 500));

    final result = burgerRemoteDataSourceImpl.getBurgers;

    expect(() => result(), throwsA(const TypeMatcher<ServerException>()));
  });
}
