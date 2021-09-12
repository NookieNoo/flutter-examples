import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
