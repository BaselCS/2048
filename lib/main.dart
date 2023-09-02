import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'game_manger.dart';
import 'my_app.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) => GameManger(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '2048',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale('Ar'),
        theme: ThemeData(
            fontFamily: 'myFont',
            textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black), titleLarge: TextStyle(color: Colors.black)),
            scaffoldBackgroundColor: const Color(0xFFFBF8EF)),
        home: const TheMainPage());
  }
}
