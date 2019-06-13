import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:st_hack/Models/Joblistmodel.dart';
import 'package:st_hack/Widgets/jobcard.dart';

class events extends StatefulWidget {
  @override
  _eventsState createState() => _eventsState();
}

class _eventsState extends State<events> {
  StreamSubscription<DocumentSnapshot> subscription;
  String myText;
  final DocumentReference documentReference =
      Firestore.instance.document("eventdata/events");

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
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class JobPage extends StatefulWidget {
  final List<JoblistModel> allJobs;

  JobPage(this.allJobs);

  @override
  State<StatefulWidget> createState() {
    return JobPageState();
  }
}

class JobPageState extends State<JobPage> {
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
                  itemCount: widget.allJobs.length,
                  padding: const EdgeInsets.only(top: 30.0),
                  itemBuilder: (context, index) {
                    return JobCard(widget.allJobs[index]);
                  }),
            ],
          ),
        )));
  }

  Widget background_img(BuildContext context) => DecoratedBox(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
      );
}
