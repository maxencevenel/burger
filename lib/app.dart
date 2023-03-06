import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useradgents_burger/init_config.dart';

import 'presentation/blocs/blocs.dart';

class BurgerApp extends StatelessWidget {
  const BurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<BurgerBloc>()
        ..add(GetBurgersEvent()),
      child: MaterialApp(
        title: 'Burger App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: BlocBuilder<BurgerBloc, BurgerState>(
              builder: (context, state) {
                return const Text("Burger App");
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  initConfig();
}
