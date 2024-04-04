import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/prefecture/prefecture.dart';
import 'package:sake/domain/repository/prefecture.dart';
import 'package:sake/feature/infrastructure/firestore/firestore.dart';
import 'package:sake/feature/infrastructure/mapper/prefecture.dart';

class IPrefectureRepository extends PrefectureRepository {
  final firestore = FirebaseFirestore.instance;
  final prefectureDB = Firestore.prefecture;

  @override
  Future<List<Prefecture>> getPrefectures() async {
    final List<Prefecture> lstPrefecture = [];
    await prefectureDB.orderBy('sort', descending: false).get().then(
      (snapshot) {
        for (final doc in snapshot.docs) {
          final prefecture = PrefectureMapper.fromJSON(doc.data(), doc.id);
          lstPrefecture.add(prefecture);
        }
      },
    );
    return Future.value(lstPrefecture);
  }
}

final prefectureRepositoryProvider = Provider<IPrefectureRepository>(
  (ref) => IPrefectureRepository(),
);
