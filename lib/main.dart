import 'package:flutter/material.dart';
import 'package:untitled10/layout/main_layout.dart';

void main(){

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: false, // Android 12
    ),
    home: const MainLayout(),
    );
  }
}