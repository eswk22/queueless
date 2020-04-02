import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../branch_repository.dart';
import '../entities/entities.dart';
import '../models/models.dart';

class FirebaseBranchRepository implements BranchRepository {
  final orgCollection = Firestore.instance.collection('Branchs');

  @override
  Future<void> addNewBranch(Branch org) {
    return orgCollection.add(org.toEntity().toDocument());
  }

  @override
  Future<void> deleteBranch(Branch org) async {
    return orgCollection.document(org.id).delete();
  }

  @override
  Stream<List<Branch>> getBranches() {
    return orgCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Branch.fromEntity(BranchEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateBranch(Branch update) {
    return orgCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}