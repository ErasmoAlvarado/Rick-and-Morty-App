import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlCharacterProvider = Provider<String>((ref) {
  return 'https://rickandmortyapi.com/api/character';
});