import 'package:flutter/material.dart';
import 'package:st_hack/ui/events.dart';
import 'Authentication/auth.dart';
import 'Authentication/auth_provider.dart';
import 'RootPage.dart';
import 'ui/HomePage.dart';
import 'ui/Uidata.dart';

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
        routes: <String, WidgetBuilder>{
        
       // Uidata.root:(BuildContext context) =>  new RootPage(),
        Uidata.home:(BuildContext context) =>  new HomePage(),
        Uidata.events:(BuildContext context) =>  new events(),
  
},
      ),
    );
  }
}