
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_data_source.dart';

class NetworkDataSourceImpl implements NetworkDataSource {

  final InternetConnectionChecker _internetConnectionChecker;

  const NetworkDataSourceImpl({
    required InternetConnectionChecker internetConnectionChecker,
  }) : _internetConnectionChecker = internetConnectionChecker;

  @override
  Future<bool> get hasConnection => _internetConnectionChecker.hasConnection;


}