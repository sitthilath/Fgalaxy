import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  const User(
      { this.id = 0,
       this.email = '',
       this.username = '',
       this.password = '',
       this.firstName = '',
       this.lastName = '',
       this.gender = '',
       this.image = '',
       this.token = ''});

  @override
  List<Object?> get props =>
      [id, username, password, email, firstName, lastName, gender, email, token];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'token': token,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) => User(
        id: map['id'] ?? 0,
        email: map['email'] ?? '',
        username: map['username'] ?? '',
        password: map['password'] ?? '',
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        gender: map['gender'] ?? '',
        image: map['image'] ?? '',
        token: map['token'] ?? '',
      );

  User copyWith(
      {int? id,
      String? username,
      String? password,
      String? email,
      String? firstName,
      String? lastName,
      String? gender,
      String? image,
      String? token}) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }
}
