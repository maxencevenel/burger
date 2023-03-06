import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useradgents_burger/core/helpers/extensions/double_extension.dart';
import 'package:useradgents_burger/presentation/blocs/cart/cart_bloc.dart';
import 'package:useradgents_burger/presentation/helpers/size_config.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';
import 'package:useradgents_burger/presentation/views/common/custom_network_image.dart';
import 'package:useradgents_burger/presentation/views/common/quantity_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.orders.isEmpty) {
          return Center(
            child: Text("Votre panier est vide",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          width: double.infinity,
          child: Column(children: [
            Expanded(
              child: _buildBurgerList(context: context, state: state),
            ),
            _buildTotalContainer(context, state)
          ]),
        );
      },
    );
  }

  Container _buildTotalContainer(BuildContext context, CartState state) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: getProportionateScreenHeight(70),
      decoration: BoxDecoration(
        color: AppTheme.darkGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total : ",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white)),
              Text("${state.orders.length} produit(s)",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
            ],
          ),
          Text("${state.total.format()}€",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white)),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              // minimumSize: Size(
              //     double.infinity, getProportionateScreenHeight(50)),
              foregroundColor: Colors.white,
              backgroundColor: AppTheme.mediumGreyColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: () {},
            child: const Text("Commander"),
          ),
        ],
      ),
    );
  }

  ListView _buildBurgerList(
      {required BuildContext context, required CartState state}) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: state.orders.length,
        itemBuilder: (context, index) {
          final order = state.orders[index];
          return Container(
            margin: EdgeInsets.only(bottom: getProportionateScreenHeight(16.0)),
            padding: EdgeInsets.all(getProportionateScreenHeight(8.0)),
            height: getProportionateScreenHeight(130),
            decoration: BoxDecoration(
              color: AppTheme.darkGreyColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                SizedBox(
                    width: size.width * .3,
                    child:
                        CustomNetworkImage(imagePath: order.burger.thumbnail!)),
                SizedBox(width: getProportionateScreenWidth(16.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.burger.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white)),
                    SizedBox(height: getProportionateScreenHeight(16.0)),
                    Text("${order.price.format()}€",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white)),
                    SizedBox(height: getProportionateScreenHeight(16.0)),
                    QuantityWidget(
                      key: ValueKey(order.quantity),
                      buttonColor: AppTheme.mediumGreyColor,
                      initialValue: order.quantity,
                      onQuantityChanged: (quantity) {
                        context.read<CartBloc>().add(UpdateQuantityOrderEvent(
                            burgerRef: order.burger.ref,
                            newQuantity: quantity));
                      },
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
