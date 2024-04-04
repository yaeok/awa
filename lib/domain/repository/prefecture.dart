import 'package:sake/domain/entity/prefecture/prefecture.dart';

abstract class PrefectureRepository {
  Future<List<Prefecture>> getPrefectures();
}
