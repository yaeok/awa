import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sake/domain/entity/sake/sake.dart';

class SakeMapper {
  static Map<String, dynamic> toJSON(Sake sake) {
    return <String, dynamic>{
      'sakeId': sake.sakeId,
      'sakeName': sake.sakeName,
      'prefectureId': sake.prefectureId,
      'createdAt': sake.createdAt,
      'updatedAt': sake.updatedAt,
      'deletedAt': sake.deletedAt,
    };
  }

  static Sake fromJSON(Map<String, dynamic> json, String id) {
    return Sake(
      sakeId: id,
      sakeName: json['sakeName'] as String,
      prefectureId: json['prefectureId'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      deletedAt: json['deletedAt'] == null
          ? null
          : (json['deletedAt'] as Timestamp).toDate(),
    );
  }
}
