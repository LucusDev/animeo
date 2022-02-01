import 'package:animeo/core/models/state.dart';
import 'package:animeo/search/controller/search_notifier.dart';
import 'package:animeo/search/controller/search_state.dart';
import 'package:animeo/search/model/models/search.dart';
import 'package:riverpod/riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, StateWrapper<Search, searchState>>(
        (ref) {
  throw UnimplementedError();
});
