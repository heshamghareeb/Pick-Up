import 'package:pickup/core/utils/extensions.dart';

import '../../../../core/utils/constants.dart';
import '../models/models.dart';
import '../responses/shipments_response_model.dart';

extension ShipmentsResponseMapper on ShipmentsResponseModel? {
  ShipmentsModel toDomain() {
    List<ShipmentsDataModel> data = (
        this?.shipmentsDataList
            ?.map((shipment) => shipment.toDomain()) ?? const Iterable.empty()
    ).cast<ShipmentsDataModel>().toList();

    LinksModel links = this?.shipmentsDataLinks?.toDomain() ?? LinksModel.empty();
    MetaModel meta = this?.shipmentsDataMeta?.toDomain() ?? MetaModel.empty();

    return ShipmentsModel(
      data: data,
      links: links,
      meta: meta,
    );
  }
}

extension ShipmentsDataMapper on ShipmentsDataResponse? {
  ShipmentsDataModel toDomain() {
    return ShipmentsDataModel(
      id: this?.id.orZero() ?? Constants.zero,
      code: this?.code.orEmpty() ?? Constants.empty,
      company: this?.company.orEmpty() ?? Constants.empty,
      status: this?.status.orEmpty() ?? Constants.empty,
      receiverId: this?.receiverId.orZero() ?? Constants.zero,
      receiverName: this?.receiverName.orEmpty() ?? Constants.empty,
      receiverPhone: this?.receiverPhone.orEmpty() ?? Constants.empty,
      receiverCity: this?.receiverCity.orEmpty() ?? Constants.empty,
      receiverArea: this?.receiverArea.orEmpty() ?? Constants.empty,
      receiverAddress: this?.receiverAddress.orEmpty() ?? Constants.empty,
      codeStatus: this?.codeStatus.orZero() ?? Constants.zero,
    );
  }
}

extension LinksMapper on LinksResponse? {
  LinksModel toDomain() {
    return LinksModel(
      first: this?.first.orEmpty() ?? Constants.empty,
      last: this?.last.orEmpty() ?? Constants.empty,
      prev: this?.prev.orEmpty() ?? Constants.empty,
      next: this?.next.orEmpty() ?? Constants.empty,
    );
  }
}

extension MetainksMapper on MetaResponse? {
  MetaModel toDomain() {
    return MetaModel(
      path: this?.path.orEmpty() ?? Constants.empty,
      perPage: this?.perPage.orZero() ?? Constants.zero,
      nextCursor: this?.nextCursor.orEmpty() ?? Constants.empty,
      prevCursor: this?.prevCursor.orEmpty() ?? Constants.empty,
    );
  }
}
