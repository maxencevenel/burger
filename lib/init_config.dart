import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:useradgents_burger/core/constants/constants.dart';
import 'package:useradgents_burger/data/data_sources/data_sources.dart';
import 'package:useradgents_burger/data/repositories/repositories.dart';
import 'package:useradgents_burger/domain/repositories/repositories.dart';
import 'package:useradgents_burger/domain/usecases/usecases.dart';
import 'package:useradgents_burger/presentation/blocs/blocs.dart';

GetIt getIt = GetIt.instance;

void initConfig() {
  final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  getIt.registerLazySingleton<Dio>(() {
    return dio;
  });

  registerRepositories();
  registerDataSource();
  registerUseCases();
  registerBlocs();
}

void registerBlocs() {
  getIt.registerFactory<BurgerBloc>(
    () => BurgerBloc(
      getBurgersUseCase: getIt(),
    ),
  );

  getIt.registerFactory<NavigationCubit>(
    () => NavigationCubit(),
  );
}

void registerUseCases() {
  getIt.registerFactory<GetBurgersUseCase>(
    () => GetBurgersUseCase(
      burgerRepository: getIt(),
    ),
  );
}

void registerRepositories() {
  getIt.registerFactory<BurgerRepository>(
    () => BurgerRepositoryImpl(
      burgerRemoteDataSource: getIt(),
      networkDataSource: getIt(),
    ),
  );
}

void registerDataSource() {
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  getIt.registerFactory<NetworkDataSource>(
    () => NetworkDataSourceImpl(
      internetConnectionChecker: internetConnectionChecker,
    ),
  );

  getIt.registerFactory<BurgerRemoteDataSource>(
    () => BurgerRemoteDataSourceImpl(
      dio: getIt(),
    ),
  );
}
