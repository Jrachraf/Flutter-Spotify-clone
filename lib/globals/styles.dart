import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalStyles{
  BoxDecoration boxStyle({Color? color,List<Color>? listColor}){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: color ?? Color(0xff121212),
      gradient:  listColor == null ? null :  LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: listColor,
      )
    );
  }

}
class SColors{
  Color green = Color(0xff4ac776);
}