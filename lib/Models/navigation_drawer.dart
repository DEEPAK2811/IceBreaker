import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(
              "Deepak Prakash",
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: new Text(
              "Deepakprakash2811@gmail.com",
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: new CircleAvatar(
              //backgroundImage: AssetImage("assets/bg.png"),
              radius: 60,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
                      child: Container(
                child: new Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                Icon(
                  Icons.event,
                  size: 38,
                  color: Colors.orange,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                ),
                new Text("Events",style: TextStyle(fontSize: 20.0,color: Colors.purple)),
              ],
            ),
                ),
          // onTap: () => Navigator.pushNamed(context, UIData.dashboardRoute)
          ),
           new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
           InkWell(
                      child: Container(
                child: new Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                Icon(
                  Icons.event_available,
                  size: 38,
                  color: Colors.orange,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                ),
                new Text("Join an Event",style: TextStyle(fontSize: 20.0,color: Colors.purple)),
              ],
            ),
                ),
          // onTap: () => Navigator.pushNamed(context, UIData.dashboardRoute)
          ),
          new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
         InkWell(
                      child: Container(
                child: new Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                Icon(
                  Icons.settings,
                  size: 38,
                  color: Colors.orange,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                ),
                new Text("Settings",style: TextStyle(fontSize: 20.0,color: Colors.purple)),
              ],
            ),
                ),
          // onTap: () => Navigator.pushNamed(context, UIData.dashboardRoute)
          ),
          
            new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
         InkWell(
                      child: Container(
                child: new Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                Icon(
                  Icons.file_download,
                  size: 38,
                  color: Colors.orange,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                ),
                new Text("Export My Data",style: TextStyle(fontSize: 20.0,color: Colors.purple)),
              ],
            ),
                ),
          // onTap: () => Navigator.pushNamed(context, UIData.dashboardRoute)
          ),
           new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),


          new Divider(
            indent: 10.0,
            color: Colors.orange,
            height: 8.0,
          ),

          new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
         InkWell(
                      child: Container(
                child: new Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                Icon(
                  Icons.exit_to_app,
                  size: 38,
                  color: Colors.orange,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                ),
                new Text("SignOut",style: TextStyle(fontSize: 20.0,color: Colors.purple)),
              ],
            ),
                ),
          // onTap: () => Navigator.pushNamed(context, UIData.dashboardRoute)
          ),
          
        
        ],
      ),
    );
  }
}
