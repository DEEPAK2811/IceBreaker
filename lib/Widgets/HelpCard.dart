import 'package:flutter/material.dart';
import 'package:st_hack/Models/HelpListModel.dart';

class HelpCard extends StatefulWidget {
  final HelpListModel data;
  HelpCard(this.data);

  @override
  HelpCardState createState() {
    return HelpCardState(data);
  }
}

class HelpCardState extends State<HelpCard> {
  HelpListModel data;
  HelpCardState(this.data);

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Name : ${data.name}'),
            content: Text('Email : ${data.email}'),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Thanks!!"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget get helpCard {
    return new Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
        leading: const Icon(Icons.book),
        title: Text('${data.title.toUpperCase()}  '),
        subtitle: Text('Description: ${data.desc} .'),
      ),
      new ButtonTheme.bar(
          // make buttons use the appropriate styles for cards
          child: new ButtonBar(children: <Widget>[
        new FlatButton(
          child: const Text('Ready to help'),
          onPressed: () => _displayDialog(context),
        ),
      ]))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: helpCard,
        padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 10.0));
  
  }
}
