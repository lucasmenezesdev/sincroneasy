import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sincroneasy/helpers/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: GoogleFonts.montserrat(
            fontSize: 20, fontWeight: FontWeight.w400, color: cream),
      ),
      onPressed: () => onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 45), primary: color),
    );
  }
}
