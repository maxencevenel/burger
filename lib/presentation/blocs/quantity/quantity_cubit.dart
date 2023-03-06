
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubit extends Cubit<int> {
  QuantityCubit() : super(0);

  void setQuantity(int quantity) {
    emit(quantity);
  }
}
