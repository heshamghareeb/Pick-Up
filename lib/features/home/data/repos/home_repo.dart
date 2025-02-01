import 'package:pickup/features/home/data/mapper/mapper.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/home_api_service.dart';
import '../models/models.dart';


class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<ShipmentsModel>> getShipments() async {
    try {
      final response = await _homeApiService.getShipments();
      return ApiResult.success(response.toDomain());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
