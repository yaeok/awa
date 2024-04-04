import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sake/domain/entity/user/user.dart';

class UserMapper {
  static User fromJSON(Map<String, dynamic> data, String id) {
    return User(
      uid: data['uid'] as String,
      username: data['username'] as String,
      email: data['email'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      deletedAt: data['deletedAt'] != null
          ? (data['deletedAt'] as Timestamp).toDate()
          : null,
    );
  }

  static Map<String, dynamic> toJSON(User recUser) {
    return {
      'uid': recUser.uid,
      'username': recUser.username,
      'email': recUser.email,
      'createdAt': Timestamp.fromDate(recUser.createdAt),
      'updatedAt': Timestamp.fromDate(recUser.updatedAt),
      'deletedAt': recUser.deletedAt != null
          ? Timestamp.fromDate(recUser.deletedAt!)
          : null,
    };
  }
}
