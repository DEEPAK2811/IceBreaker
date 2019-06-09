import 'package:flutter/material.dart';
import 'Authentication/auth.dart';
import 'Authentication/auth_provider.dart';
import 'RootPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'IceBreaker',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: RootPage(),
      ),
    );
  }
}