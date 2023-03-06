

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:useradgents_burger/presentation/helpers/size_config.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(24.0)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(24.0)),
              child: Text(
                "Restaurants",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(24.0)),
            Container(
              height: getProportionateScreenHeight(45),
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(24.0)),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Rechercher un restaurant",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppTheme.mediumGreyColor),
                  prefixIcon:
                  const Icon(Icons.search, color: AppTheme.mediumGreyColor),
                  filled: true,
                  fillColor: AppTheme.darkGreyColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppTheme.darkGreyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppTheme.darkGreyColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(24.0)),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(48.8774978, 2.3322758),
                    zoom: 16.0,
                    maxZoom: 18.0,
                  ),
                  nonRotatedChildren: [
                    AttributionWidget.defaultWidget(
                      source: 'OpenStreetMap contributors',
                      onSourceTapped: null,
                    ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
