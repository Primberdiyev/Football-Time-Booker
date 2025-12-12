import 'package:objectbox/objectbox.dart';
import 'package:auth/objectbox.g.dart';

@Entity()
class UserModel {
  UserModel({
    this.id = 0,
    required this.uid,
    required this.login,
    required this.password,
  });
  int id;
  final String uid;
  final String login;
  final String password;
}
