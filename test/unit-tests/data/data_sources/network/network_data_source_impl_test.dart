
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:useradgents_burger/data/data_sources/network/network_data_source_impl.dart';

import 'network_data_source_impl_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {

  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late NetworkDataSourceImpl networkDataSourceImpl;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkDataSourceImpl = NetworkDataSourceImpl(
      internetConnectionChecker: mockInternetConnectionChecker,
    );
  });

  test('Should return true wken online', () async {
    when(mockInternetConnectionChecker.hasConnection).thenAnswer(
      (_) async => true,
    );

    final result = await networkDataSourceImpl.hasConnection;

    expect(result, true);
  });

  test('Should return false when offline', () async {
    when(mockInternetConnectionChecker.hasConnection).thenAnswer(
          (_) async => false,
    );
    final result = await networkDataSourceImpl.hasConnection;

    expect(result, false);
  });
}