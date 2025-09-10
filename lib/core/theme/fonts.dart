import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors/app_colors.dart';


TextTheme buildTextTheme(
  TextTheme base,
) {
  return base
      .copyWith(
        displayLarge: GoogleFonts.poppins(
          textStyle: base.displayLarge!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        displayMedium: GoogleFonts.poppins(
          textStyle: base.displayMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        displaySmall: GoogleFonts.poppins(
          textStyle: base.displaySmall!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        headlineMedium: GoogleFonts.poppins(
          textStyle: base.headlineMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        headlineSmall: GoogleFonts.poppins(
          textStyle: base.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        titleLarge: GoogleFonts.poppins(
          textStyle: base.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        bodySmall: GoogleFonts.poppins(
          textStyle: base.bodySmall!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
          ),
        ),
        titleMedium: GoogleFonts.poppins(
          textStyle: base.titleMedium!.copyWith(),
        ),
        titleSmall: GoogleFonts.poppins(
          textStyle: base.titleSmall!.copyWith(),
        ),
        bodyLarge: GoogleFonts.poppins(
          textStyle: base.bodyLarge!.copyWith(),
        ),
        bodyMedium: GoogleFonts.poppins(
          textStyle: base.bodyMedium!.copyWith(),
        ),
        labelLarge: GoogleFonts.poppins(
          textStyle: base.labelLarge!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
          ),
        ),
      )
      .apply(
        displayColor: AppColors.black,
        bodyColor: AppColors.black,
      );
}
