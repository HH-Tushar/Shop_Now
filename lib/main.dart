import 'package:flutter/material.dart';
import 'package:shop_now/screen/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}
