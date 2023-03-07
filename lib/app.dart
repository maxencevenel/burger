import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useradgents_burger/init_config.dart';
import 'package:useradgents_burger/presentation/routes/routes.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';

import 'presentation/blocs/blocs.dart';

class BurgerApp extends StatelessWidget {
  const BurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<BurgerBloc>()..add(GetBurgersEvent())),
        BlocProvider(create: (context) => getIt<NavigationCubit>()),
        BlocProvider(create: (context) => getIt<CartBloc>()),
      ],
      child: MaterialApp(
        title: 'UserAdgents Shop',
        theme: AppTheme.theme,
        routes: Routes.routes,
      ),
    );
  }
}

Future initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  initConfig();
}
