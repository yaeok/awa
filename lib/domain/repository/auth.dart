import 'package:sake/domain/entity/auth/auth.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmail({
    required Auth authInfo,
  });
  Future<void> signInWithEmail({
    required Auth authInfo,
  });
  Future<void> signOut();
  Future<void> sendEmailVerification();
}
