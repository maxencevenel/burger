

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:useradgents_burger/domain/entities/burger.dart';

import '../../data_mocks.dart';

void main() {
  test('FromMap should return Burger', () {
    final result = Burger.fromMap(jsonDecode(burgerJson));
    expect(result, burger1);
  });
}