import 'package:animeo/core/models/state.dart';
import 'package:animeo/search/controller/search_state.dart';
import 'package:animeo/search/model/models/search.dart';
import 'package:riverpod/riverpod.dart';

class SearchNotifier extends StateNotifier<StateWrapper<Search, searchState>> {
  SearchNotifier(Search search)
      : super(StateWrapper(value: search, state: searchState.idle));

  Future<void> addSearch(String search) async {
    if (state.state == searchState.busy) return;
    state = state.setState(searchState.busy);
    state = state.setValue(await state.value.setSearch([search]));
    state = state.setState(searchState.idle);
  }

  Future<void> deleteSearch(String search) async {
    if (state.state == searchState.busy) return;
    state = state.setState(searchState.busy);
    state = state.setValue(await state.value.deleteSearch([search]));
    state = state.setState(searchState.idle);
  }
}
