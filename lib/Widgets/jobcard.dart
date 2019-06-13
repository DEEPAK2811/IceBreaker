
import 'package:flutter/material.dart';
import 'package:st_hack/Models/Joblistmodel.dart';

class JobCard extends StatefulWidget {
  final JoblistModel data;

  JobCard(this.data);

  @override
  State<StatefulWidget> createState() {
    return JobCardState(data);
  }
}

class JobCardState extends State<JobCard> {
  JoblistModel data;
  String renderUrl;

  JobCardState(this.data);

  Widget get jobCard {
    return new Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
        leading: const Icon(Icons.book),
        title: Text('${data.name.toUpperCase()} :: ${data.location} '),
        subtitle: Text('Description: ${data.desc} .'),
      ),
      new ButtonTheme.bar(
          // make buttons use the appropriate styles for cards
          child: new ButtonBar(children: <Widget>[
        new FlatButton(
          child: const Text('Agree=>Work'),
          onPressed: () {/* ... */},
        ),
        new FlatButton(
          child: const Text('Deny'),
          onPressed: () {/* ... */},
        )
      ]))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: jobCard,
      padding:const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 10.0)
    );
  }
}