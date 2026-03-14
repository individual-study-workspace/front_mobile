import '../../../core/api/api_client.dart';
import '../model/test_dto.dart';

class TestRepository {
  final ApiClient api;

  TestRepository(this.api);

  Future<TestDto> getRandomQuiz() async {
    final res = await api.dio.get("/quiz/random");
    return TestDto.fromJson(res.data);
  }
}
