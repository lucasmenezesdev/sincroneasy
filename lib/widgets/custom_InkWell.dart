import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/styles.dart';

InkWell customInkWell(void Function()? ontap, String text, double size,
    FontWeight fontWeight, Color color) {
  return InkWell(
    child: customText(text, size, color, fontWeight),
    onTap: ontap,
  );
}
