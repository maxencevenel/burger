import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useradgents_burger/core/helpers/assets/assets.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';
import 'package:useradgents_burger/presentation/blocs/burger/burger_bloc.dart';
import 'package:useradgents_burger/presentation/helpers/size_config.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';
import 'package:useradgents_burger/core/helpers/extensions/bloc_status_extension.dart';

import 'widgets/burger_card.dart';
import 'widgets/filter_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Burgers",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white)),
            SizedBox(height: getProportionateScreenHeight(16.0)),
            Container(
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(16.0)),
                height: getProportionateScreenHeight(60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FilterIcon(
                        name: "Chicken",
                        iconName: Assets.iconsChicken,
                        isSelected: true),
                    FilterIcon(name: "Beef", iconName: Assets.iconsBeef),
                    FilterIcon(
                        name: "Vegetable", iconName: Assets.iconsVegetable),
                    FilterIcon(name: "Cheese", iconName: Assets.iconsCheese),
                  ],
                )),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<BurgerBloc>().add(GetBurgersEvent());
                },
                backgroundColor: AppTheme.darkGreyColor,
                child: BlocBuilder<BurgerBloc, BurgerState>(
                  builder: (context, state) {
                    if (state.status.isSuccess) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: getProportionateScreenHeight(200),
                          crossAxisCount: 2,
                          crossAxisSpacing: getProportionateScreenWidth(10),
                          mainAxisSpacing: getProportionateScreenHeight(16),
                        ),
                        itemBuilder: (context, index) =>
                            _buildCard(context, state.burgers[index]),
                        itemCount: state.burgers.length,
                      );
                    }
                    if (state.status.isError) {
                      return _buildErrorMessage(context);
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _buildErrorMessage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
                vertical: getProportionateScreenHeight(16)),
            child: const Text(
                "Une erreur est survenue lors de la récupération des burgers",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.mediumGreyColor),
              onPressed: () {
                context.read<BurgerBloc>().add(GetBurgersEvent());
              },
              child: const Text("Réessayer")),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, Burger burger) {
    return BurgerCard(
      name: burger.title,
      description: burger.description,
      price: burger.priceInEuro,
      image: burger.thumbnail,
    );
  }
}
