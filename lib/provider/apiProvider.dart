import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikisanchez/domain/api_repository.dart';

final apiProvider = Provider<ApiRepositories>((ref) {
  return ApiRepositories();
});