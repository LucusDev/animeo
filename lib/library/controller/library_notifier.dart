import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/models/state.dart';
import 'package:animeo/library/model/database/library_db.dart';
import 'package:animeo/main.dart';
import 'package:riverpod/riverpod.dart';

enum LibraryState {
  idle,
  busy,
}

class LibraryNotifier
    extends StateNotifier<StateWrapper<Map<String, Anime>, LibraryState>> {
  LibraryNotifier(List<Anime> animes)
      : super(StateWrapper(value: {
          ...animes.asMap().map((_, value) => MapEntry(value.id, value))
        }, state: LibraryState.idle));

  Future<void> addToLibrary(Anime anime) async {
    if (state.state == LibraryState.busy) return;
    state = state.setState(LibraryState.busy);
    await getIt<LibraryDb>().addToLibrary(anime);
    final rV = state.value;
    rV[anime.id] = anime;
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
