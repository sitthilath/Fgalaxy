import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String accessToken;
  final UserData userData;

  const User({
    required this.accessToken,
    required this.userData
  });

  @override
  List<Object?> get props => [accessToken, userData];

  factory User.fromJson(Map<String, dynamic> map) =>
      User(
        accessToken: map['access_token'],
        userData: UserData.fromJson(map['data']),
      );

  User copyWith({
    String? accessToken,
    UserData? userData,
  }) {
    return User(
        accessToken: accessToken ?? this.accessToken,
        userData: userData ?? this.userData);
  }

  Map<String, dynamic> toJson() =>
      {
        "access_token": accessToken,
        "data": userData.toJson(),
      };
}

class UserData extends Equatable {
  final int id;
  final String? username;
  final String? email;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime verifyAt;
  final List<Role> roles;

  const UserData({
    required this.id,
    this.username = '',
    this.email = '',
    required this.phone,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
    required this.verifyAt,
  });

  @override
  List<Object?> get props {
    return [id, username, email, phone, roles, verifyAt];
  }

  factory UserData.fromJson(Map<String, dynamic> map) =>
      UserData(
        id: map['id'],
        username: map['username'] ?? '',
        email: map['email']?? '',
        phone: map['phone'],
        roles: List<Role>.from(
            map['roles'].map((json) => Role.fromJson(json))),
        createdAt: DateTime.parse(map["created_at"]),
        updatedAt: DateTime.parse(map["updated_at"]),
        verifyAt: DateTime.parse(map["verify_at"]),
      );

  UserData copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
    List<Role>? roles,
  }) {
    return UserData(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles,
      createdAt: createdAt,
      updatedAt: updatedAt,
      verifyAt: verifyAt,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "verify_at": verifyAt.toIso8601String(),
      };
}
class Role {
  int id;
  String name;
  String description;
  List<dynamic> permissions;

  Role({
    required this.id,
    required this.name,
    required this.description,
    required this.permissions,
  });

  factory Role.fromJson(Map<String, dynamic> json) =>
      Role(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        permissions: List<dynamic>.from(json["permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "description": description,
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
      };
}
