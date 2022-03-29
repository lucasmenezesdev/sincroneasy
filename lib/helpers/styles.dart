import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color orange = Color(0xFFee8323);
Color cream = Color(0xFFf0f2e7);
Color blue = Color(0xFF2e3346);
Color brown = Color(0xFF3a3434);
Color grey = Color.fromARGB(255, 214, 204, 204);

screenSize(BuildContext context) {
  double size = MediaQuery.of(context).size.width;
  return size;
}

Text customText(String text, double size, Color? color) {
  return Text(
    text,
    style: GoogleFonts.montserrat(fontSize: size, color: color ?? Colors.black),
  );
}
