import 'package:flutter/material.dart';
import 'package:st_hack/ui/Uidata.dart';

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
              backgroundImage: AssetImage("assets/1.png"),
              radius: 60,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
             decoration: BoxDecoration(image: new DecorationImage(
               image: AssetImage("assets/3.png"), fit: BoxFit.cover
)),
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
                    color: Colors.black,
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                  ),
                  new Text("Create Events",
                      style: TextStyle(fontSize: 20.0, color: Colors.pink)),
                ],
              ),
            ),
            onTap: () {
              // change app state...
              Navigator.pop(context);
              Navigator.pushNamed(context, Uidata.create_events);
              // close the drawer
            },
            //=> Navigator.pushNamed(context, Uidata.create_events)
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
                    Icons.event_note,
                    size: 38,
                    color: Colors.black,
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                  ),
                  new Text("Available Event",
                      style: TextStyle(fontSize: 20.0, color: Colors.pink)),
                ],
              ),
            ),
            onTap: () {
              // change app state...
              Navigator.pop(context);
              Navigator.pushNamed(context, Uidata.events);
              // close the drawer
            },
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
                    color: Colors.black,
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                  ),
                  new Text("Joined Events",
                      style: TextStyle(fontSize: 20.0, color: Colors.pink)),
                ],
              ),
            ),
            onTap: () {
              // change app state...
              Navigator.pop(context);
              Navigator.pushNamed(context, Uidata.event_space);
              // close the drawer
            },
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
                    color: Colors.black,
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                  ),
                  new Text("Settings",
                      style: TextStyle(fontSize: 20.0, color: Colors.pink)),
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
                    Icons.featured_play_list,
                    size: 38,
                    color: Colors.black,
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                  ),
                  new Text("Export My Data",
                      style: TextStyle(fontSize: 20.0, color: Colors.pink)),
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
                    color: Colors.teal,
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                  ),
                  new Text("SignOut",
                      style: TextStyle(fontSize: 20.0, color: Colors.purple)),
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
