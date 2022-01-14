import 'package:json_annotation/json_annotation.dart';

class UserModel {
  String email;
  String username;
  String usertype;
  String password;

  UserModel(this.email, this.username, this.password, this.usertype);


}