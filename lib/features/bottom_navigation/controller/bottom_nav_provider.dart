import 'dart:async';

import 'package:riverpod/riverpod.dart';

final scrollStreamProvider = Provider((ref) {
  return StreamController<bool>.broadcast();
});

class ScrollOffsetState extends StateNotifier<double> {
  ScrollOffsetState({double state = 0}) : super(state);
  double get setOffset => state;
  set setOffset(double offset) {
    state = offset;
  }
}

final scrollOffsetProvider =
    StateNotifierProvider<ScrollOffsetState, double>((ref) {
  return ScrollOffsetState();
});
