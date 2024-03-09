import 'package:flutter/material.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/widgets/padding.dart';

class Button1 extends StatelessWidget {
  const Button1({
    super.key,
    required this.buttonText,
    required this.buttonPressed,
  });
  final String buttonText;
  final Function buttonPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorAndFont.GREEN,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          return buttonPressed();
        },
        child: Text(
          buttonText,
          style: ColorAndFont.BUTTON_TEXT,
        ),
      ),
    );
  }
}
