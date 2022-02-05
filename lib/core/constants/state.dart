import 'package:flutter/cupertino.dart';

class TempState extends ChangeNotifier {
  bool isOldFirst = true;
  setisOldFirst(bool val) {
    isOldFirst = val;
    notifyListeners();
  }
}
