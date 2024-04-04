import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/user/user.dart';
import 'package:sake/domain/repository/user.dart';
import 'package:sake/feature/infrastructure/firestore/firestore.dart';
import 'package:sake/feature/infrastructure/mapper/user.dart';

class IUserRepository extends UserRepository {
  IUserRepository();

  final firestore = FirebaseFirestore.instance;
  final userDB = Firestore.user;

  @override
  Future<User> getUser({
    required String userId,
  }) async {
    final recUser = await userDB.doc(userId).get().then(
      (doc) {
        if (doc.exists) {
          return UserMapper.fromJSON(doc.data()!, doc.id);
        }
      },
    );
    return Future.value(recUser);
  }

  @override
  Future<User> updUser({
    required User user,
  }) {
    // TODO: implement updUser
    throw UnimplementedError();
  }
}

final userRepositoryProvider = Provider<IUserRepository>(
  (ref) => IUserRepository(),
);
