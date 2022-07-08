import 'package:flutter/material.dart';

import '../helpers/styles.dart';

InkWell customInkWell(void Function()? ontap, String text, double size,
    FontWeight fontWeight, Color color) {
  return InkWell(
    child: Row(
      children: [
        customText(text, size, color, fontWeight),
        const Icon(Icons.arrow_forward_rounded)
      ],
    ),
    onTap: ontap,
  );
}
