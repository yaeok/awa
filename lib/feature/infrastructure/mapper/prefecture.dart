import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sake/domain/entity/prefecture/prefecture.dart';

class PrefectureMapper {
  static Prefecture fromJSON(Map<String, dynamic> json, String id) {
    return Prefecture(
      prefectureId: id,
      prefectureNameEn: json['prefectureNameEn'] as String,
      prefectureNameJp: json['prefectureNameJp'] as String,
      sort: json['sort'] as int,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      deletedAt: json['deletedAt'] != null
          ? (json['deletedAt'] as Timestamp).toDate()
          : null,
    );
  }

  static Map<String, dynamic> toJSON(Prefecture recPrefecture) {
    return <String, dynamic>{
      'prefectureId': recPrefecture.prefectureId,
      'prefectureNameEn': recPrefecture.prefectureNameEn,
      'prefectureNameJp': recPrefecture.prefectureNameJp,
      'sort': recPrefecture.sort,
      'createdAt': recPrefecture.createdAt,
      'updatedAt': recPrefecture.updatedAt,
      'deletedAt': recPrefecture.deletedAt,
    };
  }
}
