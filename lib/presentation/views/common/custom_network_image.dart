import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
            "https://www.useradgents.com/img/logo_ua200.png", color: Colors.white,);
      },
    );
  }
}
