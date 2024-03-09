
import 'package:flutter/material.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/widgets/padding.dart';


class Tittles extends StatelessWidget {
  const Tittles({
    super.key,
    required this.tittle,
  });
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: Text(tittle, style: ColorAndFont.TITTLE_TEXT),
    );
  }
}
