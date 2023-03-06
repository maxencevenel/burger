import 'package:flutter_bloc/flutter_bloc.dart';


class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void updateIndex(index) {
    emit(index);
  }

  void navigateToHomePage() => updateIndex(0);
  void navigateToCart() => updateIndex(2);
}
