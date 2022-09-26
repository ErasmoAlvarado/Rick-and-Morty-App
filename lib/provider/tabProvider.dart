import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});