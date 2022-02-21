import 'package:fluttertoast/fluttertoast.dart';

Future<void> showToast({
  required String message,
  Toast length = Toast.LENGTH_SHORT,
}) async {
  await Fluttertoast.cancel();
  await Fluttertoast.showToast(
    msg: message,
    toastLength: length,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.0,
  );
}
