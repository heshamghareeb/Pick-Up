import 'package:json_annotation/json_annotation.dart';

part 'shipments_response_model.g.dart';

@JsonSerializable()
class ShipmentsResponseModel {
  @JsonKey(name: 'data')
  List<ShipmentsDataResponse?>? shipmentsDataList;
  @JsonKey(name: 'links')
  LinksResponse? shipmentsDataLinks;
  @JsonKey(name: 'meta')
  MetaResponse? shipmentsDataMeta;


  ShipmentsResponseModel({
    this.shipmentsDataList,
    this.shipmentsDataLinks,
    this.shipmentsDataMeta,
  });

  factory ShipmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentsResponseModelFromJson(json);
}

@JsonSerializable()
class ShipmentsDataResponse {
  int? id;
  String? code;
  String? company;
  String? status;
  @JsonKey(name: 'receiver_id')
  int? receiverId;
  @JsonKey(name: 'receiver_name')
  String? receiverName;
  @JsonKey(name: 'receiver_phone')
  String? receiverPhone;
  @JsonKey(name: 'receiver_city')
  String? receiverCity;
  @JsonKey(name: 'receiver_area')
  String? receiverArea;
  @JsonKey(name: 'receiver_address')
  String? receiverAddress;
  @JsonKey(name: 'code_status')
  int? codeStatus;

  ShipmentsDataResponse({
    this.id,
    this.code,
    this.company,
    this.status,
    this.receiverName,
    this.receiverPhone,
    this.receiverCity,
    this.receiverArea,
    this.receiverAddress,
    this.codeStatus,
  });

  factory ShipmentsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ShipmentsDataResponseFromJson(json);
}

@JsonSerializable()
class LinksResponse {
  String? first;
  String? last;
  String? prev;
  String? next;

  LinksResponse({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory LinksResponse.fromJson(Map<String, dynamic> json) =>
      _$LinksResponseFromJson(json);
}

@JsonSerializable()
class MetaResponse {
  String? path;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'next_cursor')
  String? nextCursor;
  @JsonKey(name: 'code_status')
  String? prevCursor;

  MetaResponse({
    this.path,
    this.perPage,
    this.nextCursor,
    this.prevCursor,
  });

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);
}