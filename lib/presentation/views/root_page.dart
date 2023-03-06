import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useradgents_burger/presentation/blocs/navigation/navigation_cubit.dart';
import 'package:useradgents_burger/presentation/helpers/size_config.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';
import 'package:useradgents_burger/presentation/views/cart/cart_page.dart';
import 'package:useradgents_burger/presentation/views/home/home_page.dart';

class RootPage extends StatefulWidget {
  static const route = "/";

  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const Text("Page 2"),
    const CartPage(),
    const Text("Page 4"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: state,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0XFF1C1C1C),
              currentIndex: state,
              onTap: (index) {
                context.read<NavigationCubit>().updateIndex(index);
              },
              selectedLabelStyle: const TextStyle(color: Colors.white),
              selectedItemColor: Colors.white,
              unselectedItemColor: AppTheme.mediumGreyColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Accueil",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_outlined),
                  label: "Restaurants",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: "Panier",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outlined), label: "Profil"),
              ]);
        },
      ),
    );
  }
}
