import 'package:animeo/core/models/anime.dart';
import 'package:animeo/core/models/state.dart';
import 'package:animeo/library/controller/library_notifier.dart';
import 'package:riverpod/riverpod.dart';

final libraryProvider = StateNotifierProvider<LibraryNotifier,
    StateWrapper<Map<String, Anime>, LibraryState>>(
  (ref) {
    throw UnimplementedError();
  },
);
