import 'package:chat_ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectMenuProvider = StateProvider((ref) => 0);

void main() {
  runApp(ProviderScope(child: MyApp()));
  //runApp(
  //  ProviderScope(child: MyApp()),
  //);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
