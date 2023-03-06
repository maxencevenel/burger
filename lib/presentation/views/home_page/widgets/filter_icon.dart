
import 'package:flutter/material.dart';
import 'package:useradgents_burger/presentation/helpers/size_config.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';

class FilterIcon extends StatefulWidget {
  const FilterIcon({
    super.key,
    required this.name,
    required this.iconName,
    this.isSelected = false,
  });

  final String name;
  final String iconName;
  final bool isSelected;

  @override
  State<FilterIcon> createState() => _FilterIconState();
}

class _FilterIconState extends State<FilterIcon> {
  late bool _isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        // margin: const EdgeInsets.only(right: 32.0),
        decoration: BoxDecoration(
          color:
          _isSelected ? AppTheme.mediumGreyColor : AppTheme.darkGreyColor,
          shape: BoxShape.circle,
        ),
        height: getProportionateScreenHeight(57),
        width: getProportionateScreenHeight(57),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.iconName, color: Colors.white),
            Text(widget.name,
                style: const TextStyle(fontSize: 9, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
