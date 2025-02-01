import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/shared_pref_helper.dart';
import '../data/models/models.dart';
import '../data/repos/home_repo.dart';
import '../data/responses/shipments_response_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  late ShipmentsModel shipmentsList;
  List<ShipmentsDataModel> filteredShipments = [];
  String searchQuery = '';

  void getShipments() async {
    print('test getShipments');
    emit(const HomeState.shipmentsLoading());
    final response = await _homeRepo.getShipments();
    response.when(
      success: (shipmentsResponseModel) {
        shipmentsList = shipmentsResponseModel;
        filteredShipments = shipmentsResponseModel.data;

        emit(HomeState.shipmentsSuccess(shipmentsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.shipmentsError(errorHandler));
      },
    );
  }

  void searchShipments(String query) {
    searchQuery = query.trim();

    if (searchQuery.isEmpty) {
      filteredShipments = shipmentsList.data;
    } else {
      filteredShipments = shipmentsList.data.where((shipment) {
        bool matches = shipment.id.toString().contains(searchQuery);
        return matches;
      }).toList();
    }


    emit(HomeState.shipmentsSuccess(
      ShipmentsModel(
        data: filteredShipments,
        links: shipmentsList.links,
        meta: shipmentsList.meta,
      ),
    ));
  }





}
