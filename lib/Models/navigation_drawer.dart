import 'package:flutter/material.dart';



class NavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Drawer(
    
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Deepak Prakash",style:TextStyle(color: Colors.white),),
            accountEmail: new Text("Deepakprakash2811@gmail.com",style:TextStyle(color: Colors.white),),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: AssetImage("assets/bg.png"),
              radius: 40,
            ),
             decoration: BoxDecoration(image: new DecorationImage(
               image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover
             )),
          ),

          new ListTile(
            title: new Text("Events "),
           // onTap: () => Navigator.pushNamed(context, UIData.dashboardRoute)
            ),
          new ListTile(
            title: new Text("Join an Event"),
            
          ),
          new ListTile(
            title: new Text("Settings"),
            
          ),
          new ListTile(
            title: new Text("Export My Data"),
            
          ),

          new Divider(indent: 10.0,),
          new ListTile(
            title: new Text("Sign Out"),
           
          )
        ],

      ),
    );
  }
}