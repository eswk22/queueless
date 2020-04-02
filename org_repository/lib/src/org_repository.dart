import 'dart:async';

import 'models/models.dart';



abstract class OrgRepository {
  Future<void> addNewOrg(Organization todo);

  Future<void> deleteOrg(Organization todo);

  Stream<List<Organization>> orgs();

  Future<void> updateOrg(Organization todo);
}