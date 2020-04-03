import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import '../userprofile_repository.dart';

class FirebaseUserProfileRepository implements UserProfileRepository {
  final userProfileCollection = Firestore.instance.collection('UserProfile');

  @override
  Future<void> addNewUserProfile(UserProfile userProfile) {
    return userProfileCollection.add(userProfile.toEntity().toDocument());
  }

  @override
  Future<void> deleteUserProfile(UserProfile userProfile) async {
    return userProfileCollection.document(userProfile.id).delete();
  }

  @override
  Stream<List<UserProfile>> getUserProfiles() {
    return userProfileCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => UserProfile.fromEntity(UserProfileEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateUserProfile(UserProfile update) {
    return userProfileCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}