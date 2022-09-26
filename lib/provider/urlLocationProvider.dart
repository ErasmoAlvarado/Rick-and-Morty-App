import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlLocationProvider = StateProvider.autoDispose((ref) {
  return 'https://rickandmortyapi.com/api/location';
});