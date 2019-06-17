import 'package:flutter/material.dart';
import 'package:st_hack/Models/Joblistmodel.dart';
import 'package:st_hack/ui/Uidata.dart';

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
  static String my_space_id;
  TextEditingController textEditController = new TextEditingController();

  JobCardState(this.data);

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter Key'),
            content: TextField(
              controller: textEditController,
              decoration: InputDecoration(hintText: "Enter Secret Key to join"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Join Event',style: TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  if (textEditController.text == data.secret_key) {
                    my_space_id = data.id;
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Uidata.event_space);
                  }
                },
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Colors.orange,
              ),
            ],
          );
        });
  }

  Widget get jobCard {
    return new Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
        leading: const Icon(Icons.event_note),
        title: Text('${data.name.toUpperCase()} :: ${data.location} '),
        subtitle: Text('Description: ${data.desc} .'),
      ),
      new ButtonTheme.bar(
          // make buttons use the appropriate styles for cards
          child: new ButtonBar(children: <Widget>[
        new FlatButton(
          child: new Text('Join Event',style: TextStyle(fontSize: 14.0, color: Colors.white)),
          onPressed: () => _displayDialog(context),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Colors.green,
        ),
        new FlatButton(
           child: new Text('Deny/Out of Reach',style: TextStyle(fontSize: 14.0, color: Colors.white)),
          onPressed: () {/* ... */},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Colors.red,
        )
      ]))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: jobCard,
        padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 10.0));
  }
}
