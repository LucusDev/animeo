import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  Toast length = Toast.LENGTH_SHORT,
}) async {
  await Fluttertoast.cancel();
  await Fluttertoast.showToast(
    msg: message,
    toastLength: length,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: 16.0,
  );
}
