import 'package:flutter/material.dart';
import 'package:movies/UI/home_screen.dart';
import 'package:movies/UI/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppTheme.ScaffoldBackGroundColor,
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: AppTheme.BottomNavigationBarColor,
          )),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
