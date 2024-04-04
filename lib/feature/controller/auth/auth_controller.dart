import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/auth/auth.dart';
import 'package:sake/domain/repository/auth.dart';
import 'package:sake/feature/infrastructure/auth.dart';

class AuthController extends StateNotifier<void> {
  AuthController({
    required this.authController,
  }) : super([]);

  final AuthRepository authController;

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final auth = Auth(
      email: email,
      password: password,
    );
    await authController.signInWithEmail(authInfo: auth);
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    final auth = Auth(
      email: email,
      password: password,
    );
    await authController.signUpWithEmail(authInfo: auth);
  }

  Future<void> signOut() async {
    await authController.signOut();
  }

  Future<void> sendEmailVerification() async {
    await authController.sendEmailVerification();
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, void>(
  (ref) => AuthController(
    authController: ref.watch(authRepositoryProvider),
  ),
);
