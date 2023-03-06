import 'package:flutter/material.dart';
import 'package:useradgents_burger/presentation/helpers/size_config.dart';
import 'package:useradgents_burger/presentation/theme/app_theme.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    super.key,
    this.buttonColor = AppTheme.lightGreyColor,
    this.initialValue = 0,
    required this.onQuantityChanged,
  });

  final Color buttonColor;
  final Function(int) onQuantityChanged;
  final int initialValue;

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int _quantity = 0;

  @override
  initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: getProportionateScreenHeight(32),
      width: getProportionateScreenHeight(90),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(4)),
      decoration: BoxDecoration(
        color: AppTheme.darkGreyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _decrement,
            child: Container(
                decoration: BoxDecoration(
                  color: widget.buttonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(Icons.remove)),
          ),
          SizedBox(width: getProportionateScreenHeight(8)),
          Text("$_quantity",
              style: textTheme.titleMedium!
                  .copyWith(color: Colors.white, fontSize: 16)),
          SizedBox(width: getProportionateScreenHeight(8)),
          GestureDetector(
            onTap: _increment,
            child: Container(
                decoration: BoxDecoration(
                  color: widget.buttonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(Icons.add)),
          ),
        ],
      ),
    );
  }

  void _increment() {
    if (_quantity == 9) return;
    setState(() {
      _quantity++;
    });
    widget.onQuantityChanged(_quantity);
  }

  void _decrement() {
    if (_quantity == 0) return;
    setState(() {
      _quantity--;
    });
    widget.onQuantityChanged(_quantity);
  }
}
