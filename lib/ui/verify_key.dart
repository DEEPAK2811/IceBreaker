import 'package:flutter/material.dart';
import 'package:st_hack/ui/Uidata.dart';

class Verify_key extends StatefulWidget {
  final String id;
  Verify_key({Key key, @required this.id}) : super(key: key);

  @override
  _Verify_keyState createState() => _Verify_keyState();
}

class _Verify_keyState extends State<Verify_key> {
  TextEditingController textEditController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //backgroundColor: Colors.black,
        body:new  Container(
            width: MediaQuery.of(context).size.width / 1.2,
        height: 200,
        padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            new TextField(
              decoration:
                  new InputDecoration(hintText: "Enter Secret Key to Join"),
              controller: textEditController,
            ),
            new FlatButton(
              child: new Text("Join"),
              onPressed: () {
                if (textEditController.text == widget.id) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Uidata.event_space);
                }
              },
            ),
          ]),
        ));
  }
  
}
