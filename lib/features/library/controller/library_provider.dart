import 'package:riverpod/riverpod.dart';

import '../../../core/models/state.dart';
import '../model/models/library_anime.dart';
import 'library_notifier.dart';

final libraryProvider = StateNotifierProvider<LibraryNotifier,
    StateWrapper<Map<String, LibraryAnime>, LibraryState>>(
  (ref) {
    throw UnimplementedError();
  },
);
