import 'dart:async';

import 'models/models.dart';



abstract class UserFavoriteRepository {
  Future<void> addNewUserFavorite(UserFavorite userProfile);

  Future<void> deleteUserFavorite(UserFavorite userProfile);

  Stream<List<UserFavorite>> getUserFavorites();

  Future<void> updateUserFavorite(UserFavorite userProfile);

  
}