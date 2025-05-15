import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue, // Google Blue
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[100],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.grey[800]),
      titleTextStyle: TextStyle(color: Colors.grey[800], fontSize: 20, fontWeight: FontWeight.w500),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      surface: Colors.white, // For cards, text field backgrounds
      onSurface: Colors.black87,
      onPrimary: Colors.white,
      background: Colors.grey[100]!,
      onBackground: Colors.black87,
      tertiaryContainer: Colors.blue.withOpacity(0.1), // For selected tab background
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.grey[500]),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue, // Text color for TextButtons
      ),
    ),
    dividerColor: Colors.grey[300],
    extensions: <ThemeExtension<dynamic>>[
      CustomThemeExtension(
        inputPanelBackground: Colors.white,
        outputPanelBackground: Colors.grey[200]!,
        selectedLanguageUnderline: Colors.blue,
        unselectedLanguageColor: Colors.grey[700]!,
        iconColor: Colors.grey[600]!,
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[300],
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.grey[300]),
      titleTextStyle: TextStyle(color: Colors.grey[300], fontSize: 20, fontWeight: FontWeight.w500),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.blue[300]!,
      secondary: Colors.blueAccent[100]!,
      surface: Colors.grey[800]!, // For cards, text field backgrounds
      onSurface: Colors.white70,
      onPrimary: Colors.black,
      background: Colors.grey[900]!,
      onBackground: Colors.white70,
      tertiaryContainer: Colors.blue.withOpacity(0.2), // For selected tab background
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.grey[600]),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue[300], // Text color for TextButtons
      ),
    ),
    dividerColor: Colors.grey[700],
    extensions: <ThemeExtension<dynamic>>[
      CustomThemeExtension(
        inputPanelBackground: Colors.grey[850]!,
        outputPanelBackground: Colors.grey[800]!,
        selectedLanguageUnderline: Colors.blue[300]!,
        unselectedLanguageColor: Colors.grey[400],
        iconColor: Colors.grey[500],
      ),
    ],
  );
}

// Custom theme extension for properties not directly supported by ThemeData
@immutable
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  const CustomThemeExtension({
    required this.inputPanelBackground,
    required this.outputPanelBackground,
    required this.selectedLanguageUnderline,
    required this.unselectedLanguageColor,
    required this.iconColor,
  });

  final Color inputPanelBackground;
  final Color outputPanelBackground;
  final Color selectedLanguageUnderline;
  final Color? unselectedLanguageColor;
  final Color? iconColor;


  @override
  CustomThemeExtension copyWith({
    Color? inputPanelBackground,
    Color? outputPanelBackground,
    Color? selectedLanguageUnderline,
    Color? unselectedLanguageColor,
    Color? iconColor,
  }) {
    return CustomThemeExtension(
      inputPanelBackground: inputPanelBackground ?? this.inputPanelBackground,
      outputPanelBackground: outputPanelBackground ?? this.outputPanelBackground,
      selectedLanguageUnderline: selectedLanguageUnderline ?? this.selectedLanguageUnderline,
      unselectedLanguageColor: unselectedLanguageColor ?? this.unselectedLanguageColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  CustomThemeExtension lerp(ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    return CustomThemeExtension(
      inputPanelBackground: Color.lerp(inputPanelBackground, other.inputPanelBackground, t)!,
      outputPanelBackground: Color.lerp(outputPanelBackground, other.outputPanelBackground, t)!,
      selectedLanguageUnderline: Color.lerp(selectedLanguageUnderline, other.selectedLanguageUnderline, t)!,
      unselectedLanguageColor: Color.lerp(unselectedLanguageColor, other.unselectedLanguageColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
    );
  }
}