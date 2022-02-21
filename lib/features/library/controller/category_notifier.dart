import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../model/database/category_db.dart';

class Category extends ChangeNotifier {
  Category({List<String> categories = const []}) {
    _category.addAll(categories);
  }

  static final categoryProvider = ChangeNotifierProvider<Category>((ref) {
    throw UnimplementedError();
  });

  final List<String> _category = [];
  String current = 'default';
  List<String> get category => _category;

  void addCategory(String name) {
    if (_category.contains(name)) return;

    getIt<CategoryDb>().add(name).then((_) {
      _category.add(name);
      notify();
    });
  }

  String get setCurrent => current;
  set setCurrent(String name) {
    current = name;
    notify();
  }

  void notify() {
    notifyListeners();
  }
}
