import 'package:freezed_annotation/freezed_annotation.dart';

part 'sake.freezed.dart';

@freezed
class Sake with _$Sake {
  const factory Sake({
    required String sakeId,
    required String sakeName,
    required String prefectureId,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Sake;
}
