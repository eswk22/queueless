import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import '../userfavorite_repository.dart';

class FirebaseUserFavoriteRepository implements UserFavoriteRepository {
  final userProfileCollection = Firestore.instance.collection('UserFavorite');

  @override
  Future<void> addNewUserFavorite(UserFavorite userProfile) {
    return userProfileCollection.add(userProfile.toEntity().toDocument());
  }

  @override
  Future<void> deleteUserFavorite(UserFavorite userProfile) async {
    return userProfileCollection.document(userProfile.id).delete();
  }

  @override
  Stream<List<UserFavorite>> getUserFavorites() {
    return userProfileCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => UserFavorite.fromEntity(UserFavoriteEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateUserFavorite(UserFavorite update) {
    return userProfileCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}