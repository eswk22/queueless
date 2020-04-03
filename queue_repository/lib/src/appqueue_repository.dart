import 'dart:async';

import 'models/models.dart';



abstract class AppQueueRepository {
  Future<void> addNewAppQueue(AppQueue userProfile);

  Future<void> deleteAppQueue(AppQueue userProfile);

  Stream<List<AppQueue>> getAppQueues();

  Future<void> updateAppQueue(AppQueue userProfile);
}