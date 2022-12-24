import 'package:database/Screens/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
    title: 'Student Information',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(200)
          ),
          borderSide: BorderSide(
            width: 2,
            color: Colors.black
          )
        ),
      )
    ),
    home: const HomePage()
  ));
}
