import 'package:sake/domain/entity/sake/sake.dart';

abstract class SakeRepository {
  Future<Sake> getSake({
    required String sakeId,
  });
  Future<Sake> regSake({
    required Sake sake,
  });
}
