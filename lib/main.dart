import 'package:expense_tracker/Expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.black);

void main() {
  runApp(MaterialApp(
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
    home: const Expenses(),
  ));
}
