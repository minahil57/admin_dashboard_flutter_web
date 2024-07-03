import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getBoldStyle({
  Color color = kcBlackColor,
  double fontSize = 24,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getMediumStyle({
  Color color = kcBlackColor,
  double fontSize = 18,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
  );
}

TextStyle getRegularStyle({
  Color color = kcBlackColor,
  double fontSize = 14,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    letterSpacing: -0.5,
  );
}
