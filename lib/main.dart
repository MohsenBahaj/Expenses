import 'package:expenses/home.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

// /myDarkColorScheme
ColorScheme myColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));
ColorScheme myDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      // themeMode: ThemeMode.dark,
      theme: ThemeData().copyWith(
          colorScheme: myColorScheme,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: myColorScheme.primary,
              foregroundColor: myColorScheme.onPrimary),
          cardTheme: const CardTheme().copyWith(
              color: myColorScheme.secondaryContainer,
              surfaceTintColor: myColorScheme.onSecondaryContainer),
          listTileTheme: ListTileThemeData().copyWith(),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myColorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: myColorScheme.onSecondary))),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: myDarkColorScheme,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: myDarkColorScheme.primary,
              foregroundColor: myDarkColorScheme.onPrimary),
          cardTheme: const CardTheme().copyWith(
              color: myDarkColorScheme.secondaryContainer,
              surfaceTintColor: myDarkColorScheme.onSecondaryContainer),
          listTileTheme: ListTileThemeData().copyWith(),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myDarkColorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: myDarkColorScheme.onSecondary)),
          bottomSheetTheme: BottomSheetThemeData()
              .copyWith(backgroundColor: myDarkColorScheme.secondaryContainer)),
    );
  }
}
