// Mocks generated by Mockito 5.3.2 from annotations
// in useradgents_burger/test/unit-tests/presentation/blocs/burger/burger_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:multiple_result/multiple_result.dart' as _i2;
import 'package:useradgents_burger/core/errors/failure.dart' as _i6;
import 'package:useradgents_burger/core/helpers/generics/params.dart' as _i7;
import 'package:useradgents_burger/domain/entities/burger.dart' as _i5;
import 'package:useradgents_burger/domain/usecases/burger/get_burgers_usecase.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<S, E> extends _i1.SmartFake implements _i2.Result<S, E> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetBurgersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetBurgersUseCase extends _i1.Mock implements _i3.GetBurgersUseCase {
  MockGetBurgersUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<List<_i5.Burger>, _i6.Failure>> call(
          {_i7.NoParam? param}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#param: param},
        ),
        returnValue:
            _i4.Future<_i2.Result<List<_i5.Burger>, _i6.Failure>>.value(
                _FakeResult_0<List<_i5.Burger>, _i6.Failure>(
          this,
          Invocation.method(
            #call,
            [],
            {#param: param},
          ),
        )),
      ) as _i4.Future<_i2.Result<List<_i5.Burger>, _i6.Failure>>);
}
