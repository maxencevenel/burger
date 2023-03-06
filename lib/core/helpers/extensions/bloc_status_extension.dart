
import 'package:useradgents_burger/core/helpers/enums/bloc_status.dart';

extension BlocStatusExtension on BlocStatus {
  bool get isInit => this == BlocStatus.init;

  bool get isLoading => this == BlocStatus.loading;

  bool get isSuccess => this == BlocStatus.success;

  bool get isError => this == BlocStatus.error;
}