import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import '../org_repository.dart';

class FirebaseOrgRepository implements OrgRepository {
  final orgCollection = Firestore.instance.collection('Organizations');

  @override
  Future<void> addNewOrg(Organization org) {
    return orgCollection.add(org.toEntity().toDocument());
  }

  @override
  Future<void> deleteOrg(Organization org) async {
    return orgCollection.document(org.id).delete();
  }

  @override
  Stream<List<Organization>> orgs() {
    return orgCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Organization.fromEntity(OrgEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateOrg(Organization update) {
    return orgCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}