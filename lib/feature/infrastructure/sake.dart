import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/sake/sake.dart';
import 'package:sake/domain/repository/sake.dart';
import 'package:sake/feature/infrastructure/firestore/firestore.dart';
import 'package:sake/feature/infrastructure/mapper/sake.dart';

class ISakeRepository extends SakeRepository {
  final firestore = FirebaseFirestore.instance;
  final sakeDB = Firestore.sake;

  @override
  Future<Sake> getSake({
    required String sakeId,
  }) async {
    final recSake = await sakeDB.doc(sakeId).get().then(
      (doc) {
        if (doc.exists) {
          return SakeMapper.fromJSON(doc.data()!, doc.id);
        }
      },
    );
    return Future.value(recSake);
  }

  @override
  Future<Sake> regSake({required Sake sake}) async {
    final id = sakeDB.doc().id;
    final Sake recSake = Sake(
      sakeId: id,
      sakeName: sake.sakeName,
      prefectureId: sake.prefectureId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await sakeDB.doc(id).set(
          SakeMapper.toJSON(recSake),
        );
    return Future.value(recSake);
  }
}

final sakeRepositoryProvider = Provider<ISakeRepository>(
  (ref) => ISakeRepository(),
);
