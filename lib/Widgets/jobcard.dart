import 'package:flutter/material.dart';
import 'package:st_hack/Models/Joblistmodel.dart';
import 'package:st_hack/ui/HomePage.dart';
import 'package:st_hack/ui/Uidata.dart';

class JobCard extends StatefulWidget {
  final JoblistModel data;
  final BuildContext ctxt;

  JobCard(this.data,this.ctxt);

  @override
  State<StatefulWidget> createState() {
    return JobCardState(data,ctxt);
  }
}

class JobCardState extends State<JobCard> {
  JoblistModel data;
  BuildContext ctxt;
  JobCardState(this.data,this.ctxt);
  String renderUrl;
  static String my_space_id;
  final textEditController =TextEditingController();

  

  _displayDialog(BuildContext context) {
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
                child: new Text('Join Event',
                    style: TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  if (textEditController.text == data.secret_key) {
                    my_space_id = data.id;
                    print(my_space_id);
                    //Navigator.pop(ctxt);
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
          child: new Text('Join Event',
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
          onPressed: () {
            //Navigator.pushNamed(context, Uidata.home);
            
            _displayDialog(context);
                                //Navigator.pop(ctxt);

            },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          color: Colors.green,
        ),
        new FlatButton(
          child: new Text('Deny/Out of Reach',
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
          onPressed: () {
            /* ... */
          },
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
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    //textEditController.dispose();
    super.dispose();
  }
}
