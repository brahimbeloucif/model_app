import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText {
  static Text defStyle({
    required String txt,
    double fontSize = 16,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w700,
    TextAlign textAlign = TextAlign.center,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      txt,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? overflow : null,
    );
  }
  
  // For titles
  static Text title({
    required String txt,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.center,
  }) {
    return defStyle(
      txt: txt,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: color,
      textAlign: textAlign,
    );
  }
  
  // For subtitles
  static Text subtitle({
    required String txt,
    Color color = Colors.black54,
    TextAlign textAlign = TextAlign.center,
  }) {
    return defStyle(
      txt: txt,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color,
      textAlign: textAlign,
    );
  }
  
  // For body text
  static Text body({
    required String txt,
    Color color = Colors.black87,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
  }) {
    return defStyle(
      overflow: TextOverflow.ellipsis,
      txt: txt,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines ??1,
    );
  }
}