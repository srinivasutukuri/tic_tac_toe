import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/provider/gameprovider.dart';

import 'package:tabbar/views/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => GameProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login screen',
        home: Homescreen(),
      ),
    );
  }
}
