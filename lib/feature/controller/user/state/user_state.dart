import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sake/domain/entity/article/output/output_article.dart';
import 'package:sake/domain/entity/prefecture/prefecture.dart';
import 'package:sake/domain/entity/user/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required User recUser,
    required List<OutputArticle> lstUserWithArticle,
    required List<Prefecture> lstPrefecture,
  }) = _UserState;
}
