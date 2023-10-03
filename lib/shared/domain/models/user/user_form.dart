import 'package:equatable/equatable.dart';

class UserForm extends Equatable {
  final String phoneNumber;
  final String password;
  final String otpCode;

  const UserForm(
      {this.otpCode = '', this.phoneNumber = '', this.password = ''});

  @override
  List<Object?> get props => [phoneNumber, password];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phone': phoneNumber,
      'password': password,
    };
  }
  Map<String, dynamic> phoneToJson(){
    return <String, dynamic> {
      'phone': phoneNumber,
    };
  }

  Map<String, dynamic> verifyToJson(){
    return <String, dynamic>{
      'phone': phoneNumber,
      'code': otpCode,
    };
  }
}
