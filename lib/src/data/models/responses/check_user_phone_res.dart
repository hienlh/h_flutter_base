import 'dart:convert';

class CheckUserPhoneResponse {
  CheckUserPhoneResponse({
    this.data = const _Data(),
  });

  final _Data data;

  CheckUserPhoneResponse copyWith({
    _Data? data,
  }) =>
      CheckUserPhoneResponse(
        data: data ?? this.data,
      );

  factory CheckUserPhoneResponse.fromRawJson(String str) =>
      CheckUserPhoneResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckUserPhoneResponse.fromJson(Map<String, dynamic>? json) =>
      CheckUserPhoneResponse(
        data: _Data.fromJson(json?['data']),
      );

  Map<String, dynamic> toJson() => {
        'data': data.toJson(),
      };
}

class _Data {
  const _Data({
    this.phone = '',
    this.name = '',
  });

  final String phone;
  final String name;

  _Data copyWith({
    String? phone,
    String? name,
  }) =>
      _Data(
        phone: phone ?? this.phone,
        name: name ?? this.name,
      );

  factory _Data.fromJson(Map<String, dynamic>? json) => _Data(
        phone: json?['usrPhn'] ?? '',
        name: json?['fullNm'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'usrPhn': phone,
        'fullNm': name,
      };
}
