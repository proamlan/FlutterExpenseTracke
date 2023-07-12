import 'package:expense_tracker/Expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark()
        .copyWith(useMaterial3: true, colorScheme: kDarkColorScheme),
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.onPrimary),
        cardTheme: CardTheme(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 4)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
                backgroundColor: kColorScheme.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14))),
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
