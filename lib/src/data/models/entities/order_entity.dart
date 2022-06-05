import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    String? id,
    String? code,
    String? customerName,
    String? customerPhone,
    String? customerEmail,
    String? shippingAddress,
    String? shippingProvince,
    String? shippingDistrict,
    String? shippingWard,
    String? shippingStreet,
    String? note,
    int? status,
    double? totalOrderItemAmount,
    double? shippingFee,
    double? totalAmount,
    bool? isPaid,
    String? voucherCode,
    double? discountByVoucherCode,
    String? customerId,
    DateTime? creationTime,
    String? vnPayPaymentURL,
    double? loyaltyPoint,
  }) = _OrderEntity;

  factory OrderEntity.fromJson(Map<String, Object?> json) =>
      _$OrderEntityFromJson(json);
}
