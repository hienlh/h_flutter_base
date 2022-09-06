import 'dart:convert';

class SignInPhoneEmailRes {
  SignInPhoneEmailRes({
    this.emailOrPhone,
    this.createdAt,
    this.expireAt,
    this.nextTimeAllowSendOtp,
  });

  final String? emailOrPhone;
  final DateTime? createdAt;
  final DateTime? expireAt;
  final DateTime? nextTimeAllowSendOtp;

  SignInPhoneEmailRes copyWith({
    String? emailOrPhone,
    DateTime? createdAt,
    DateTime? expireAt,
    DateTime? nextTimeAllowSendOtp,
  }) =>
      SignInPhoneEmailRes(
        emailOrPhone: emailOrPhone ?? this.emailOrPhone,
        createdAt: createdAt ?? this.createdAt,
        expireAt: expireAt ?? this.expireAt,
        nextTimeAllowSendOtp: nextTimeAllowSendOtp ?? this.nextTimeAllowSendOtp,
      );

  factory SignInPhoneEmailRes.fromRawJson(String str) =>
      SignInPhoneEmailRes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInPhoneEmailRes.fromJson(Map<String, dynamic>? json) =>
      SignInPhoneEmailRes(
        emailOrPhone: json?["emailOrPhone"],
        createdAt: json?["createdAt"] != null
            ? DateTime.parse(json?["createdAt"])
            : null,
        expireAt: json?["expireAt"] != null
            ? DateTime.parse(json?["expireAt"])
            : null,
        nextTimeAllowSendOtp: json?["nextTimeAllowSendOtp"] != null
            ? DateTime.parse(json?["nextTimeAllowSendOtp"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "emailOrPhone": emailOrPhone,
        "createdAt": createdAt?.toIso8601String(),
        "expireAt": expireAt?.toIso8601String(),
        "nextTimeAllowSendOtp": nextTimeAllowSendOtp?.toIso8601String(),
      };
}
