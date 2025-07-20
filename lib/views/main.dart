import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/providers/user_provider.dart';
import 'package:suitmedia_test/views/first_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suitmedia Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF554AF0)),
      ),
      home: const FirstScreen(),
    );
  }
}
