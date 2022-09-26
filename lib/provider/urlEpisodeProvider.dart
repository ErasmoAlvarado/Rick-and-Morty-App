import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlEpisodeProvider = StateProvider.autoDispose<String>((ref) {
  return 'https://rickandmortyapi.com/api/episode';
});