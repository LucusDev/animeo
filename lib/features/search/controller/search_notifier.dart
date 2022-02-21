import 'package:riverpod/riverpod.dart';

import '../../../core/models/state.dart';
import '../model/models/search.dart';
import 'search_state.dart';

class SearchNotifier extends StateNotifier<StateWrapper<Search, SearchState>> {
  SearchNotifier(Search search)
      : super(StateWrapper(value: search, state: SearchState.idle));

  Future<void> addSearch(String search) async {
    if (state.state == SearchState.busy) return;
    state = state.setState(SearchState.busy);
    state = state.setValue(await state.value.setSearch([search]));
    state = state.setState(SearchState.idle);
  }

  Future<void> deleteSearch(String search) async {
    if (state.state == SearchState.busy) return;
    state = state.setState(SearchState.busy);
    state = state.setValue(await state.value.deleteSearch([search]));
    state = state.setState(SearchState.idle);
  }
}
