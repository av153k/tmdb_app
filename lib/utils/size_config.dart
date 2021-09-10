import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double _height = 0.0;

  static double _width = 0.0;

  double get height => _height;
  double get width => _width;

  set context(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }
}
