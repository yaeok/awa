import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/auth/auth.dart';
import 'package:sake/domain/entity/user/user.dart' as domain;
import 'package:sake/domain/repository/auth.dart';
import 'package:sake/feature/infrastructure/firestore/firestore.dart';
import 'package:sake/feature/infrastructure/mapper/user.dart';

class IAuthRepository extends AuthRepository {
  IAuthRepository();

  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final userDB = Firestore.user;

  @override
  Future<void> signInWithEmail({
    required Auth authInfo,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: authInfo.email,
        password: authInfo.password,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            throw 'user-not-found';
          case 'wrong-password':
            throw 'wrong-password';
          case 'too-many-requests':
            throw 'too-many-requests';
          case 'user-disabled':
            throw 'user-disabled';
          case 'invalid-credential':
            throw 'invalid-credential';
          case 'invalid-email':
            throw 'invalid-email';
          default:
            throw 'unknown-error';
        }
      }
    }
  }

  @override
  Future<void> signUpWithEmail({
    required Auth authInfo,
  }) async {
    UserCredential? userInfo;
    try {
      userInfo = await firebaseAuth.createUserWithEmailAndPassword(
        email: authInfo.email,
        password: authInfo.password,
      );
      sendEmailVerification();
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            throw 'user-not-found';
          case 'wrong-password':
            throw 'wrong-password';
          case 'weak-password':
            throw 'weak-password';
          case 'too-many-requests':
            throw 'too-many-requests';
          case 'invalid-email':
            throw 'invalid-email';
          default:
            throw 'unknown-error';
        }
      }
    }

    if (userInfo == null) {
      return;
    }
    // ユーザー名をメールアドレスから取得
    final username = userInfo.user!.email!.split('@').first;
    final userDoc = userDB.doc(userInfo.user!.uid);
    // userDBでそのユーザーのIDが存在するか確認
    final docSnapshot = await userDoc.get();
    // userDBにそのユーザーのIDがない場合、新しいアカウントを作成
    if (!docSnapshot.exists) {
      final user = domain.User(
        uid: userInfo.user!.uid,
        username: username,
        email: userInfo.user!.email!,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await userDoc.set(
        UserMapper.toJSON(user),
      );
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> sendEmailVerification() {
    final user = firebaseAuth.currentUser;
    return user!.sendEmailVerification();
  }
}

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => IAuthRepository(),
);
