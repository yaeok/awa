import 'package:freezed_annotation/freezed_annotation.dart';

part 'prefecture.freezed.dart';

@freezed
class Prefecture with _$Prefecture {
  const factory Prefecture({
    required String prefectureId,
    required String prefectureNameEn,
    required String prefectureNameJp,
    required int sort,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Prefecture;
}
