import 'package:equatable/equatable.dart';

class UserForm extends Equatable {
  final String phoneNumber;
  final String password;
  final String tokenID;

  const UserForm(
      {required this.phoneNumber, required this.password, this.tokenID = ''});

  @override
  List<Object?> get props => [phoneNumber, password];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone_number': phoneNumber,
      'password': password,
      'token_id': tokenID,
    };
  }
}
