import 'package:flutter/material.dart';

TextStyle textStyle({double? size, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: "Montserrat",
    color: color ?? Colors.black,
    fontSize: size ?? 18,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
