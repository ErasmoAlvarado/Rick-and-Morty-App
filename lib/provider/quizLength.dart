import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizLenghtProvider = StateProvider<int>((ref) {
  return 5;
});