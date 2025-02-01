import '../../../../core/utils/constants.dart';

class ShipmentsModel {
  List<ShipmentsDataModel> data;
  LinksModel links;
  MetaModel meta;

  ShipmentsModel({
    required this.data,
    required this.links,
    required this.meta,
  });
}

class ShipmentsDataModel {
  int id;
  String code;
  String company;
  String status;
  int receiverId;
  String receiverName;
  String receiverPhone;
  String receiverCity;
  String receiverArea;
  String receiverAddress;
  int codeStatus;

  ShipmentsDataModel({
    required this.id,
    required this.code,
    required this.company,
    required this.status,
    required this.receiverId,
    required this.receiverName,
    required this.receiverPhone,
    required this.receiverCity,
    required this.receiverArea,
    required this.receiverAddress,
    required this.codeStatus,
  });
}

class LinksModel {
  String? first;
  String? last;
  String? prev;
  String? next;

  LinksModel({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });


  static LinksModel empty() {
    return LinksModel(
      first: Constants.empty,
      last: Constants.empty,
      prev: Constants.empty,
      next: Constants.empty,
    );
  }


}

class MetaModel {
  String path;
  int perPage;
  String nextCursor;
  String? prevCursor;

  MetaModel({
    required this.path,
    required this.perPage,
    required this.nextCursor,
    required this.prevCursor,
  });


  static MetaModel empty() {
    return MetaModel(
      path: Constants.empty,
      perPage: Constants.zero,
      nextCursor: Constants.empty,
      prevCursor: Constants.empty,
    );
  }

}
