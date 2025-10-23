import 'package:objectbox/objectbox.dart';
import 'package:auth/objectbox.g.dart';

@Entity()
class UserModel {
  UserModel({
    this.id = 0,
    required this.email,
    required this.password,
  });

  int id;
  final String email;
  final String password;
}
