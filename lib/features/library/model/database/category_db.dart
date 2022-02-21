import '../../../../core/constants/names.dart';
import '../../../../core/models/db.dart';

class CategoryDb extends Db<String> {
  CategoryDb() : super(name: Names.categoryName);

  Future<void> add(String name) async {
    await auto(() async {
      await db.put(name, name);
    });
  }

  Future<void> delete(String name) async {
    await auto(() async {
      await db.delete(name);
    });
  }

  Future<List<String>> get() async {
    return auto(() async {
      return db.values.toList();
    });
  }

  Future<void> clear() async {
    await auto(() async {
      await db.clear();
    });
  }
}
