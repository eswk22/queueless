import 'dart:async';

import 'models/models.dart';



abstract class UserProfileRepository {
  Future<void> addNewUserProfile(UserProfile userProfile);

  Future<void> deleteUserProfile(UserProfile userProfile);

  Stream<List<UserProfile>> getUserProfiles();

  Future<void> updateUserProfile(UserProfile userProfile);
}