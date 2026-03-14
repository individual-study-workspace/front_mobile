import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../controller/test_controller.dart';
import '../repository/test_repository.dart';

final apiClientProvider = Provider((ref) => ApiClient());

final testRepositoryProvider = Provider(
  (ref) => TestRepository(ref.read(apiClientProvider)),
);

final testControllerProvider =
    StateNotifierProvider<TestController, AsyncValue>(
      (ref) => TestController(ref.read(testRepositoryProvider)),
    );
