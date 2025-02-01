// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentsResponseModel _$ShipmentsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShipmentsResponseModel(
      shipmentsDataList: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ShipmentsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipmentsDataLinks: json['links'] == null
          ? null
          : LinksResponse.fromJson(json['links'] as Map<String, dynamic>),
      shipmentsDataMeta: json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipmentsResponseModelToJson(
        ShipmentsResponseModel instance) =>
    <String, dynamic>{
      'data': instance.shipmentsDataList,
      'links': instance.shipmentsDataLinks,
      'meta': instance.shipmentsDataMeta,
    };

ShipmentsDataResponse _$ShipmentsDataResponseFromJson(
        Map<String, dynamic> json) =>
    ShipmentsDataResponse(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      company: json['company'] as String?,
      status: json['status'] as String?,
      receiverName: json['receiver_name'] as String?,
      receiverPhone: json['receiver_phone'] as String?,
      receiverCity: json['receiver_city'] as String?,
      receiverArea: json['receiver_area'] as String?,
      receiverAddress: json['receiver_address'] as String?,
      codeStatus: (json['code_status'] as num?)?.toInt(),
    )..receiverId = (json['receiver_id'] as num?)?.toInt();

Map<String, dynamic> _$ShipmentsDataResponseToJson(
        ShipmentsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'company': instance.company,
      'status': instance.status,
      'receiver_id': instance.receiverId,
      'receiver_name': instance.receiverName,
      'receiver_phone': instance.receiverPhone,
      'receiver_city': instance.receiverCity,
      'receiver_area': instance.receiverArea,
      'receiver_address': instance.receiverAddress,
      'code_status': instance.codeStatus,
    };

LinksResponse _$LinksResponseFromJson(Map<String, dynamic> json) =>
    LinksResponse(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$LinksResponseToJson(LinksResponse instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      nextCursor: json['next_cursor'] as String?,
      prevCursor: json['code_status'] as String?,
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'path': instance.path,
      'per_page': instance.perPage,
      'next_cursor': instance.nextCursor,
      'code_status': instance.prevCursor,
    };
