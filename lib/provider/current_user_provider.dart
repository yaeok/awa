import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ログインしているユーザー情報を取得するプロバイダー
final currentUserProvider = StreamProvider<User?>(
  (ref) {
    return FirebaseAuth.instance.authStateChanges();
  },
);
