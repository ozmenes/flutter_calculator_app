import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        // ignore: deprecated_member_use
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
          // ignore: unnecessary_null_comparison
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
