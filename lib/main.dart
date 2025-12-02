import 'package:flutter/material.dart';

import 'common/string.dart' as strings;
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: strings.appName,
      home: const HomeScreen(initialCounter: 10),
    );
  }
}
