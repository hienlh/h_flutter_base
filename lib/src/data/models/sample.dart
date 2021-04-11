class UserModel {
  UserModel({
    this.id = '',
    this.name = '',
  });

  final String id;
  final String name;

  UserModel copyWith({
    String? id,
    String? name,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
