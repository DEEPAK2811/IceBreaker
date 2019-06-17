import 'package:flutter/material.dart';
import 'package:st_hack/Authentication/auth.dart';
import 'package:st_hack/Authentication/auth_provider.dart';
import 'package:st_hack/Models/navigation_drawer.dart';

class HomePage extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new NavBar(),
      appBar: AppBar(
         backgroundColor: Colors.purple[200],
        title: Text('IceBreaker'),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout', style: TextStyle(fontSize: 17.0, color: Colors.white)),
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: Container(
        child: Center(child: Text('Home', style: TextStyle(fontSize: 32.0))),
      ),
    );


}
}