import 'package:flutter/material.dart';

class Palette {
  static const Color bgBase = Color(0xFFF4F5F6);
  static const Color bgSoft = Color(0xFFE6E8EA);
  static const Color bgSurface = Color(0xFFFFFFFF);

  static const Color statusDanger = Color(0xFFEF4444);
  static const Color statusDangerBg = Color(0xFFFEF2F2);
  static const Color statusSuccess = Color(0xFF10B981);
  static const Color statusSuccessBg = Color(0xFFECFDF5);
  static const Color statusWarning = Color(0xFFF5AB0B);
  static const Color statusWarningBg = Color(0xFFFFFBEB);
  static const Color statusInfo = Color(0xFF3B82F6);
  static const Color statusInfoBg = Color(0xFFEFF6FF);

  static const Color textPrimary = Color(0xFF1E2124);
  static const Color textSecondary = Color(0xFF58616A);
  static const Color textTertiary = Color(0xFF8A949E);
  static const Color textDisabled = Color(0xFFCDD1D5);
  static const Color textPrimaryInverse = Color(0xFFFFFFFF);

  static const Color iconPrimary = Color(0xFF1E2124);
  static const Color iconSecondary = Color(0xFF58616A);
  static const Color iconTertiary = Color(0xFF8A949E);
  static const Color iconDisabled = Color(0xFFCDD1D5);
  static const Color iconPrimaryInverse = Color(0xFFFFFFFF);

  static const Color borderDefault = Color(0xFFCDD1D5);
  static const Color borderLight = Color(0xFFE6E8EA);

  static const Color primary = Color(0xFF6636FF);
  static const Color primaryVariant = Color(0xFF5913FF);
  static const Color primarySoft = Color(0xFFF3EEFF);
  static const Color primaryBorder = Color(0xFFC2A8FF);

  static const Color violet900 = Color(0xFF22066A);
  static const Color violet800 = Color(0xFF320A94);
  static const Color violet700 = Color(0xFF440EC3);
  static const Color violet600 = Color(0xFF5913FF);
  static const Color violet500 = Color(0xFF6636FF);
  static const Color violet400 = Color(0xFF8551FF);
  static const Color violet300 = Color(0xFFA37DFF);
  static const Color violet200 = Color(0xFFC2A8FF);
  static const Color violet100 = Color(0xFFE0D4FF);
  static const Color violet50 = Color(0xFFF3EEFF);

  static const Color gray100 = Color(0xFF000000);
  static const Color gray95 = Color(0xFF131416);
  static const Color gray90 = Color(0xFF1E2124);
  static const Color gray80 = Color(0xFF33363D);
  static const Color gray70 = Color(0xFF464C53);
  static const Color gray60 = Color(0xFF58616A);
  static const Color gray50 = Color(0xFF6D7882);
  static const Color gray40 = Color(0xFF8A949E);
  static const Color gray30 = Color(0xFFB1B8BE);
  static const Color gray20 = Color(0xFFCDD1D5);
  static const Color gray10 = Color(0xFFE6E8EA);
  static const Color gray5 = Color(0xFFF4F5F6);
  static const Color gray0 = Color(0xFFFFFFFF);

  static const Color blue900 = Color(0xFF193071);
  static const Color blue800 = Color(0xFF1A3898);
  static const Color blue700 = Color(0xFF1B49CA);
  static const Color blue600 = Color(0xFF1F5FEA);
  static const Color blue500 = Color(0xFF3B82F6);
  static const Color blue400 = Color(0xFF60A5FA);
  static const Color blue300 = Color(0xFF93C5FD);
  static const Color blue200 = Color(0xFFBFDBFE);
  static const Color blue100 = Color(0xFFDBEAFE);
  static const Color blue50 = Color(0xFFEFF6FF);

  static const Color red900 = Color(0xFF701A1A);
  static const Color red800 = Color(0xFF8F1919);
  static const Color red700 = Color(0xFFB61B1B);
  static const Color red600 = Color(0xFFDC2626);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red400 = Color(0xFFF87171);
  static const Color red300 = Color(0xFFFCA5A5);
  static const Color red200 = Color(0xFFFECACA);
  static const Color red100 = Color(0xFFFEE2E2);
  static const Color red50 = Color(0xFFFEF2F2);

  static const Color green900 = Color(0xFF064E3B);
  static const Color green800 = Color(0xFF065F46);
  static const Color green700 = Color(0xFF047857);
  static const Color green600 = Color(0xFF059669);
  static const Color green500 = Color(0xFF10B981);
  static const Color green400 = Color(0xFF34D399);
  static const Color green300 = Color(0xFF6EE7B7);
  static const Color green200 = Color(0xFFA7F3D0);
  static const Color green100 = Color(0xFFD1FAE5);
  static const Color green50 = Color(0xFFECFDF5);

  static const Color yellow900 = Color(0xFF78550F);
  static const Color yellow800 = Color(0xFF92660E);
  static const Color yellow700 = Color(0xFFB47B09);
  static const Color yellow600 = Color(0xFFD99306);
  static const Color yellow500 = Color(0xFFF5AB0B);
  static const Color yellow400 = Color(0xFFFBBF24);
  static const Color yellow300 = Color(0xFFFCD34D);
  static const Color yellow200 = Color(0xFFFDE68A);
  static const Color yellow100 = Color(0xFFFEF3C7);
  static const Color yellow50 = Color(0xFFFFFBEB);
}

class TextTypes {
  static TextStyle h1({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      height: 1.4,
      letterSpacing: -0.85,
      color: color,
    );
  }

  static TextStyle h2({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      height: 1.4,
      letterSpacing: -0.56,
      color: color,
    );
  }

  static TextStyle h3({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.4,
      letterSpacing: -0.36,
      color: color,
    );
  }

  static TextStyle title1({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 1.4,
      letterSpacing: -0.2,
      color: color,
    );
  }

  static TextStyle title2({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1.4,
      letterSpacing: -0.18,
      color: color,
    );
  }

  static TextStyle title3({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5,
      letterSpacing: -0.08,
      color: color,
    );
  }

  static TextStyle title4({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.5,
      letterSpacing: -0.07,
      color: color,
    );
  }

  static TextStyle body1M({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.6,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle body1R({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.6,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle body2M({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.6,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle body2R({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.6,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle caption1({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.4,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle caption2({Color color = Palette.textPrimary}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.4,
      letterSpacing: 0,
      color: color,
    );
  }
}
