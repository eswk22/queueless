import 'dart:async';

import 'models/models.dart';



abstract class TokenRepository {
  Future<void> addNewToken(Token userProfile);

  Future<void> deleteToken(Token userProfile);

  Stream<List<Token>> getTokens();

  Future<void> updateToken(Token userProfile);
}