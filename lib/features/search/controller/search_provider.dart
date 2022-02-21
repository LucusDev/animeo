import 'package:riverpod/riverpod.dart';

import '../../../core/models/state.dart';
import '../model/models/search.dart';
import 'search_notifier.dart';
import 'search_state.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, StateWrapper<Search, SearchState>>(
        (ref) {
  throw UnimplementedError();
});
