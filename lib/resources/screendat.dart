import 'package:flutter/widgets.dart';

class ScreenUtil {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double blockSizeHorizontal(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.width) * percentage / 100;
  }

  static double blockSizeVertical(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.height) * percentage / 100;
  }
}
