import 'package:sake/domain/entity/user/user.dart';

abstract class UserRepository {
  Future<User> getUser({
    required String userId,
  });
  Future<User> updUser({
    required User user,
  });
}
