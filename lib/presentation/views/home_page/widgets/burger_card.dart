
import 'package:flutter/material.dart';
import 'package:useradgents_burger/core/helpers/extensions/double_extension.dart';
import 'package:useradgents_burger/presentation/helpers/size_config.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';
import 'package:useradgents_burger/presentation/views/common/custom_network_image.dart';

class BurgerCard extends StatelessWidget {
  const BurgerCard({
    super.key,
    required this.name,
    this.description,
    this.image,
    required this.price,
  });

  final String name;
  final String? description;
  final String? image;
  final double price;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        print("tapped Card");
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: getProportionateScreenHeight(180),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme.darkGreyColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      print("tapped button");
                    },
                    child: Container(
                      height: getProportionateScreenHeight(37),
                      width: getProportionateScreenHeight(39),
                      decoration: const BoxDecoration(
                        color: AppTheme.mediumGreyColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * .2,
                  width: MediaQuery.of(context).size.width * .2,
                  child: CustomNetworkImage(imagePath: image!),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5),
                    vertical: getProportionateScreenHeight(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(8)),
                    FittedBox(
                      child: Text(name, style: textTheme.titleMedium),
                    ),
                    SizedBox(height: getProportionateScreenHeight(4)),
                    Text(
                      description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall,
                    ),
                    SizedBox(height: getProportionateScreenHeight(16.0)),
                    Text(
                      "${price.format()}€",
                      style: textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}