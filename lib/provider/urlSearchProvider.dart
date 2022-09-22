 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikisanchez/provider/searchOptionProvider.dart';
import 'package:wikisanchez/provider/urlLocationProvider.dart';

final urlSearchProvider = StateProvider.family<String, String>((ref, query) {
      return 'https://rickandmortyapi.com/api/${ref.watch(SearchOptionProvider) }/?page=1&name=${query}';
    });