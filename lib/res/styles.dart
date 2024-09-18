import 'package:flutter/material.dart';
import 'package:my_profile/gen/fonts.gen.dart';
import 'package:my_profile/res/color.dart';

// 라이트 모드 테마 정의
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: primaryLightBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryLightBackgroundColor,
  ),
  textTheme: customTextTheme(ThemeData.light().textTheme),
);

// 다크 모드 테마 정의
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: primaryDarkBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryDarkBackgroundColor,
  ),
  textTheme: customTextThemeDark(ThemeData.dark().textTheme),
);

// 라이트 모드 텍스트 테마 커스터마이징 함수
TextTheme customTextTheme(TextTheme base) {
  return base.copyWith(
    headlineLarge: const TextStyle(
      fontFamily: FontFamily.pretendard,
      fontSize: 23.0,
      fontWeight: FontWeight.w700,
      color: primaryLightTextColor,
    ),
  );
}

// 다크 모드 텍스트 테마 커스터마이징 함수
TextTheme customTextThemeDark(TextTheme base) {
  return base.copyWith(
    headlineLarge: const TextStyle(
      fontFamily: FontFamily.pretendard,
      fontSize: 23.0,
      fontWeight: FontWeight.w700,
      color: primaryDarkTextColor,
    ),
  );
}

// 버튼 스타일 클래스
class ButtonStyles {
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static final ButtonStyle sideMenuButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return primaryColor; 
        }
        return Colors.transparent;
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return Colors.white;
        }
        return primaryColor;
      },
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
