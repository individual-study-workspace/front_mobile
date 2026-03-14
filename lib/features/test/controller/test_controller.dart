import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/test_dto.dart';
import '../repository/test_repository.dart';

class TestController extends StateNotifier<AsyncValue<TestDto?>> {
  final TestRepository repo;

  TestController(this.repo) : super(const AsyncValue.data(null));

  Future<void> fetchRandom() async {
    state = const AsyncValue.loading();
    try {
      final quiz = await repo.getRandomQuiz();
      state = AsyncValue.data(quiz);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
