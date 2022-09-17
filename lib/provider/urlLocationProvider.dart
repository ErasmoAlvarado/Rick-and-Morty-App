import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlLocationProvider = StateProvider((ref) {
  return 'https://rickandmortyapi.com/api/location';
});