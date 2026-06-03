import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://utatle.netlify.app/api'));
}

final apiClientProvider = Provider((ref) => ApiClient());
