import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useradgents_burger/core/helpers/extensions/double_extension.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';
import 'package:useradgents_burger/presentation/blocs/blocs.dart';
import 'package:useradgents_burger/presentation/helpers/size_config.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';
import 'package:useradgents_burger/presentation/views/common/custom_network_image.dart';
import 'package:useradgents_burger/presentation/views/common/quantity_widget.dart';

import 'widgets/rating.dart';

class BurgerDetailPage extends StatelessWidget {
  static const route = '/burger-detail';

  const BurgerDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.backgroundColor,
        title: const Text("Burger Details"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: AppTheme.darkGreyColor,
                  borderRadius: BorderRadius.circular(5)),
              child: const Center(child: Icon(Icons.arrow_back))),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.read<NavigationCubit>().navigateToCart();
              Navigator.pop(context);
            },
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: AppTheme.darkGreyColor,
                      borderRadius: BorderRadius.circular(5)),
                  child:
                      const Center(child: Icon(Icons.shopping_bag_outlined))),
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => QuantityCubit(),
        child: BlocBuilder<BurgerBloc, BurgerState>(
          builder: (context, state) {
            if (state.selectedBurger == null) {
              return const Center(
                child: Text(
                    "Une erreur est survenue lors de la récupération des burgers",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              );
            }

            final burger = state.selectedBurger!;
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(50)),
                  height: size.height * .4,
                  child: CustomNetworkImage(imagePath: burger.thumbnail!),
                ),
                Expanded(
                  child: _buildDetailsContainer(context, burger),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildDetailsContainer(BuildContext context, Burger burger) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(
          left: 24, //getProportionateScreenWidth(24.0),
          right: 24, //getProportionateScreenWidth(24.0),
          top: getProportionateScreenHeight(30)),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: getProportionateScreenHeight(32),
                ),
                SizedBox(width: getProportionateScreenHeight(8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("UserAdgents Shop",
                        style: textTheme.titleLarge!
                            .copyWith(color: AppTheme.darkGreyColor)),
                    Text("1km",
                        style:
                            textTheme.labelLarge!.copyWith(color: Colors.grey)),
                  ],
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(16)),
            Text(
              burger.title,
              style: textTheme.titleLarge!
                  .copyWith(color: AppTheme.darkGreyColor, fontSize: 22),
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
            const Rating(rating: 3),
            SizedBox(height: getProportionateScreenHeight(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${burger.priceInEuro.format()}€",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppTheme.darkGreyColor)),
                QuantityWidget(
                  onQuantityChanged: (quantity) {
                    context.read<QuantityCubit>().setQuantity(quantity);
                  },
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
            Text(
              burger.description ?? "Description manquante",
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppTheme.darkGreyColor),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
              child: BlocBuilder<QuantityCubit, int>(
                builder: (context, state) {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      disabledBackgroundColor: Colors.grey,
                      disabledForegroundColor: AppTheme.mediumGreyColor,
                      minimumSize: Size(
                          double.infinity, getProportionateScreenHeight(50)),
                      foregroundColor: Colors.white,
                      backgroundColor: AppTheme.darkGreyColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    onPressed: state == 0
                        ? null
                        : () {
                            _addToCart(context: context, burger: burger);
                          },
                    child: const Text("Add to cart"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart({required BuildContext context, required Burger burger}) {
    context.read<CartBloc>().add(AddOrderEvent(
        burger: burger, quantity: context.read<QuantityCubit>().state));
    context.read<NavigationCubit>().navigateToCart();
    Navigator.pop(context);
  }
}
