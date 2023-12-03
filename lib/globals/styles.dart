import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalStyles{
  BoxDecoration boxStyle({Color? color}){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: color ?? Color(0xff121212),
    );
  }
}