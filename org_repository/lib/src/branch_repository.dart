import 'dart:async';

import 'models/models.dart';



abstract class BranchRepository {
  Future<void> addNewBranch(Branch todo);

  Future<void> deleteBranch(Branch todo);

  Stream<List<Branch>> getBranches();

  Future<void> updateBranch(Branch todo);
}