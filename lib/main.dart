import 'package:flutter/material.dart';
import 'package:st_hack/ui/CreateHelp.dart';
import 'package:st_hack/ui/create_events.dart';
import 'package:st_hack/ui/event_space.dart';
import 'package:st_hack/ui/events.dart';
import 'package:st_hack/ui/verify_key.dart';
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
        Uidata.create_events:(BuildContext context) =>  new createjob(),
       Uidata.event_space:(BuildContext context)=>new Event_space(),
       Uidata.create_help:(BuildContext context)=>new CreateHelp(),
        //Uidata.verify_key:(BuildContext context)=>new Verify_key(id: ,),
  
},
      ),
    );
  }
}