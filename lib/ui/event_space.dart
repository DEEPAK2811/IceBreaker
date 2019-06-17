import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:st_hack/Models/HelpListModel.dart';
import 'package:st_hack/Widgets/HelpCard.dart';
import 'package:st_hack/Widgets/jobcard.dart';

import 'Uidata.dart';

class Event_space extends StatefulWidget {
  @override
  _Event_spaceState createState() => _Event_spaceState();
}

class _Event_spaceState extends State<Event_space> {
  StreamSubscription<DocumentSnapshot> subscription;
  String myText;
  static int help_count = 0;
  //static String get my_space_id => my_space_id;
  static String my_space_id = JobCardState.my_space_id;

  /*DocumentReference documentReference =
      Firestore.instance.document("event_space$my_space_id/$help_count");

  @override
  void initState() {
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Help Section !!"),
      ),
      body: st(),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
               print('Submitting to back end...value:');
               print(my_space_id);
             // Navigator.pushNamed(context, Uidata.create_help);
            },
            child: Icon(Icons.add),
          ),
      /*body: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          
          st(),
         FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, Uidata.create_events);
            },
            child: Icon(Icons.add),
          ),
          
        ],
      ),*/
      /*body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
        child: Expanded(
          child: SizedBox(
            height: 400.0,
            child: st(),
          ),
        ),
      ),*/
    );
  }

  Widget st() => new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("event_space$my_space_id")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());
            default:
              var documents = snapshot.data?.documents ?? [];
              var docs = documents
                  .map((snapshot) => HelpListModel.from(snapshot))
                  .toList();
              return HelpPage(docs);
          }
        },
      );
}

class HelpPage extends StatefulWidget {
  final List<HelpListModel> allHelps;

  HelpPage(this.allHelps);

  @override
  State<StatefulWidget> createState() {
    return HelpPageState();
  }
}

class HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    //  var filteredBaby = widget.allFish.where((BabyData data) {
    //    data.name = 'bccha';
    //  }).toList();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              background_img(context),
              ListView.builder(
                  itemCount: widget.allHelps.length,
                  padding: const EdgeInsets.only(top: 30.0),
                  itemBuilder: (context, index) {
                    return HelpCard(widget.allHelps[index]);
                  }),
            ],
          ),
        )));
  }

  Widget background_img(BuildContext context) => DecoratedBox(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("assets/3.png"), fit: BoxFit.cover)),
      );


}
