import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeCustom {
  final ThemeMode mode;
  TextThemeCustom({this.mode = ThemeMode.dark});

  TextTheme buildTextTheme() => GoogleFonts.poppinsTextTheme(
        TextTheme(
          headline1: _headline1, //font Size: 21 (Price Product Detail)
          headline2: _headLine2, //font Size: 16 (Title Product)
          headline3:
              _headLine3, //font size: 15 (FeedBack - Product Title - Đánh giá sản phẩm,... )
          headline4:
              _headLine4, //Font Size: 13 - weight: w600: (Label Grip Product - Hàng mới, Dành cho bạn,...)
          headline5: _headLine5, //Font Size: 13 - weight: w500 (Tab Bar Title)
          headline6: _headLine6, // fontSize: 13
          bodyText1: _bodyText1, // fontSize: 13 (Chat Text)
          bodyText2: _bodyText2, // fontSize: 12 (Comment - Product Detail)
          subtitle1: _subTitle1, //fontSize: 12
          subtitle2: _subTitle2,
          button: _button,
          caption: _caption,
        ),
      );

  TextStyle get _headline1 => const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          height: 1.22,
          letterSpacing: 0.15)
      .merge(_textBase);

  TextStyle get _headLine2 =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.25)
          .merge(_textBase);

  TextStyle get _headLine3 => const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0.25)
      .merge(_textBase);

  TextStyle get _headLine4 =>
      const TextStyle(fontSize: 22, fontWeight: FontWeight.w200, height: 1.23)
          .merge(_textBase);

  TextStyle get _headLine5 => _headLine4.copyWith(fontWeight: FontWeight.w500);

  TextStyle get _headLine6 => const TextStyle(
          fontSize: 14.0,
          letterSpacing: 0.0,
          height: 1.2,
          fontWeight: FontWeight.w500)
      .merge(_textBase);

  TextStyle get _caption =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)
          .merge(_textBase);

  TextStyle get _bodyText1 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ).merge(_textBase);

  TextStyle get _bodyText2 => const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.4)
      .merge(_textBase);

  TextStyle get _subTitle1 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ).merge(_textBase);

  TextStyle get _subTitle2 => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 8,
      ).merge(_textBase);

  TextStyle get _button =>
      const TextStyle(fontSize: 13, fontWeight: FontWeight.w600);

  static TextStyle get headerText1 => const TextStyle(
      fontWeight: FontWeight.w600, fontSize: 16, letterSpacing: 0.5);

  static TextStyle get iconValueText1 =>
      const TextStyle(fontWeight: FontWeight.w700, fontSize: 9);

  static TextStyle get iconValueText2 => const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 8, letterSpacing: 0.0);

  static TextStyle get iconValueText3 =>
      const TextStyle(fontWeight: FontWeight.w700, fontSize: 10);

  static TextStyle get priceValueText => const TextStyle(
      fontWeight: FontWeight.w700, fontSize: 21, letterSpacing: 0.0);

  TextStyle get _textBase {
    if (mode == ThemeMode.dark) {
      return const TextStyle(color: Colors.white);
    }
    return const TextStyle(color: Colors.black);
  }

  static TextStyle get subtitle1 =>
      const TextStyle(fontSize: 13, fontWeight: FontWeight.w500);

  static TextStyle get subtitleBeauti => const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w600, height: 1.05);

  static TextStyle styleError = const TextStyle(
      color: Color(0xFF4A2222),
      fontSize: 10,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4);

  static TextStyle discountTextStyle = const TextStyle(
      fontSize: 9,
      height: 1.2,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4);
}
