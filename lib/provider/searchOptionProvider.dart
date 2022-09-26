import 'package:flutter_riverpod/flutter_riverpod.dart';

final SearchOptionProvider = StateProvider.autoDispose<String>((ref) {
  return 'character';
});