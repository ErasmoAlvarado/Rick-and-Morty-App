import 'package:flutter_riverpod/flutter_riverpod.dart';

final SearchOptionProvider = StateProvider<String>((ref) {
  return 'character';
});