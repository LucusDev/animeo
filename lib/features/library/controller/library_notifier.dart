import 'package:riverpod/riverpod.dart';

import '../../../core/models/state.dart';
import '../../../main.dart';
import '../model/database/library_db.dart';
import '../model/models/library_anime.dart';

enum LibraryState {
  idle,
  busy,
}

class LibraryNotifier extends StateNotifier<
    StateWrapper<Map<String, LibraryAnime>, LibraryState>> {
  LibraryNotifier(List<LibraryAnime> animes)
      : super(StateWrapper(value: {
          ...animes.asMap().map((_, value) => MapEntry(value.anime.id, value))
        }, state: LibraryState.idle));

  Future<void> addToLibrary(LibraryAnime anime) async {
    if (state.state == LibraryState.busy) return;
    state = state.setState(LibraryState.busy);
    await getIt<LibraryDb>().addToLibrary(anime);
    final rV = state.value;
    rV[anime.anime.id] = anime;
    state = state.copyWith(value: rV, state: LibraryState.idle);
  }

  Future<void> deleteFromLibrary(String id) async {
    if (state.state == LibraryState.busy) return;
    state = state.setState(LibraryState.busy);
    await getIt<LibraryDb>().deleteOneAnime(id);
    final rV = state.value;
    rV.remove(id);
    state = state.copyWith(value: rV, state: LibraryState.idle);
  }
}
