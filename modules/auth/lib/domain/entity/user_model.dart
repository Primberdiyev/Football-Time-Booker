import 'package:objectbox/objectbox.dart';

@Entity()
class UserModel {
  UserModel({
    this.id = 0,
    required this.login,
    required this.password,
  });

  int id;
  final String login;
  final String password;
}
