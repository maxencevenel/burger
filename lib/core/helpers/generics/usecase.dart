import 'package:multiple_result/multiple_result.dart';
import 'package:useradgents_burger/core/errors/failure.dart';

/// [R] => Data output. [P] => Data Input. [Failure] when Error
abstract class UseCase<R, P> {
  Future<Result<Failure, R>> call({P? param});
}