import 'dart:async';

import 'package:riverpod/riverpod.dart';

final scrollStreamProvider = Provider((ref) {
  return StreamController<bool>.broadcast();
});
