import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikisanchez/domain/api_repository.dart';

final apiProvider = Provider.autoDispose<ApiRepositories>((ref) {
  return ApiRepositories();
});