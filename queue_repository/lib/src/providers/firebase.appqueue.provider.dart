import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import '../appqueue_repository.dart';

class FirebaseAppQueueRepository implements AppQueueRepository {
  final userProfileCollection = Firestore.instance.collection('AppQueue');

  @override
  Future<void> addNewAppQueue(AppQueue userProfile) {
    return userProfileCollection.add(userProfile.toEntity().toDocument());
  }

  @override
  Future<void> deleteAppQueue(AppQueue userProfile) async {
    return userProfileCollection.document(userProfile.id).delete();
  }

  @override
  Stream<List<AppQueue>> getAppQueues() {
    return userProfileCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => AppQueue.fromEntity(AppQueueEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateAppQueue(AppQueue update) {
    return userProfileCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}