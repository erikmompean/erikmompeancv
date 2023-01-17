import 'package:erikmompean/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  final int size;
  const AppLogo({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppConstants.name,
      style: GoogleFonts.arizonia(
          fontSize: 40, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
