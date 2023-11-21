import 'package:flutter/material.dart';

import 'colors.dart';

const bold = 'bold';
const regular = 'regular';
const color = whiteColor;
OurStyle({family = "regular", double? size = 14, color = whiteColor}) {
  TextStyle(fontSize: size, color: color, fontFamily: family);
}
