import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import '../token_repository.dart';

class FirebaseTokenRepository implements TokenRepository {
  final userProfileCollection = Firestore.instance.collection('Token');

  @override
  Future<void> addNewToken(Token userProfile) {
    return userProfileCollection.add(userProfile.toEntity().toDocument());
  }

  @override
  Future<void> deleteToken(Token userProfile) async {
    return userProfileCollection.document(userProfile.id).delete();
  }

  @override
  Stream<List<Token>> getTokens() {
    return userProfileCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Token.fromEntity(TokenEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateToken(Token update) {
    return userProfileCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}