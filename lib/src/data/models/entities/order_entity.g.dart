// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderEntity _$$_OrderEntityFromJson(Map<String, dynamic> json) =>
    _$_OrderEntity(
      id: json['id'] as String?,
      code: json['code'] as String?,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      customerEmail: json['customerEmail'] as String?,
      shippingAddress: json['shippingAddress'] as String?,
      shippingProvince: json['shippingProvince'] as String?,
      shippingDistrict: json['shippingDistrict'] as String?,
      shippingWard: json['shippingWard'] as String?,
      shippingStreet: json['shippingStreet'] as String?,
      note: json['note'] as String?,
      status: json['status'] as int?,
      totalOrderItemAmount: (json['totalOrderItemAmount'] as num?)?.toDouble(),
      shippingFee: (json['shippingFee'] as num?)?.toDouble(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      isPaid: json['isPaid'] as bool?,
      voucherCode: json['voucherCode'] as String?,
      discountByVoucherCode:
          (json['discountByVoucherCode'] as num?)?.toDouble(),
      customerId: json['customerId'] as String?,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      vnPayPaymentURL: json['vnPayPaymentURL'] as String?,
      loyaltyPoint: (json['loyaltyPoint'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_OrderEntityToJson(_$_OrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'customerEmail': instance.customerEmail,
      'shippingAddress': instance.shippingAddress,
      'shippingProvince': instance.shippingProvince,
      'shippingDistrict': instance.shippingDistrict,
      'shippingWard': instance.shippingWard,
      'shippingStreet': instance.shippingStreet,
      'note': instance.note,
      'status': instance.status,
      'totalOrderItemAmount': instance.totalOrderItemAmount,
      'shippingFee': instance.shippingFee,
      'totalAmount': instance.totalAmount,
      'isPaid': instance.isPaid,
      'voucherCode': instance.voucherCode,
      'discountByVoucherCode': instance.discountByVoucherCode,
      'customerId': instance.customerId,
      'creationTime': instance.creationTime?.toIso8601String(),
      'vnPayPaymentURL': instance.vnPayPaymentURL,
      'loyaltyPoint': instance.loyaltyPoint,
    };
