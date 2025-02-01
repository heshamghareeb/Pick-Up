import '../../../core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/models.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Shipments
  const factory HomeState.shipmentsLoading() = ShipmentsLoading;
  const factory HomeState.shipmentsSuccess(ShipmentsModel shipmentsDataList) = ShipmentsSuccess;
  const factory HomeState.shipmentsError(ErrorHandler errorHandler) = ShipmentsError;
}
