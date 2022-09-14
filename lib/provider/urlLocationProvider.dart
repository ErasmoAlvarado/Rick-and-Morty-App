import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlLocationProvider = Provider<String>((ref) {
  return 'https://rickandmortyapi.com/api/location';
});