import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlCharacterProvider = StateProvider.autoDispose<String>((ref) {
  return 'https://rickandmortyapi.com/api/character';
});