import 'package:flutter/widgets.dart';

class Responsive {
  static double w(BuildContext c, double ratio) =>
      MediaQuery.of(c).size.width * ratio;
  static double h(BuildContext c, double ratio) =>
      MediaQuery.of(c).size.height * ratio;
}
