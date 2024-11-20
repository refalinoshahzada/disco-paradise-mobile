import 'package:flutter/material.dart';
// import 'package:disco_paradise/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:disco_paradise/screens/login.dart'; // Adjust the path as necessary
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Disco Paradise',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(secondary: Colors.black),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}