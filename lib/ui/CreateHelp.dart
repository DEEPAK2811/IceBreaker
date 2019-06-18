import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:st_hack/Widgets/jobcard.dart';

import 'Uidata.dart';

class CreateHelp extends StatefulWidget {
  @override
  _CreateHelpState createState() => _CreateHelpState();
}

class _CreateHelpState extends State<CreateHelp> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static String my_space_id = JobCardState.my_space_id;
  
  
  List<String> _types = <String>[
    'OffTopic',
    'Immediate',
    '',
  ];
  String _type = '';
  HelpValues hv = new HelpValues();
  StreamSubscription<DocumentSnapshot> subscription;
  final DocumentReference documentReference =
      Firestore.instance.document("event_space$my_space_id/$count_help");
  static int count_help = 1;
  String oneAsString = count_help.toString();

  void _add() {
    Map<String, String> data = <String, String>{
      "title": "${hv.title}",
      "desc": "${hv.description}",
      "email":"${hv.email}",
      "name":"${hv.name}",
      "id": "${count_help}",
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
    count_help = count_help + 1;
  }

@override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
                key: _formKey,
                autovalidate: true,
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    SizedBox(height: 50.0),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.event_available),
                        hintText: 'Enter Help title',
                        labelText: 'Help Title',
                      ),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(30)
                      ],
                      onSaved: (val) => hv.title = val,
                    ),
                    
                    SizedBox(height: 24.0),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your first and last name',
                        labelText: 'Your Name',
                      ),
                      onSaved: (val) => hv.name = val,
                    ),
                    SizedBox(height: 24.0),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Enter your email address',
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (val) => hv.email = val,
                    ),
                    SizedBox(height: 24.0),
                    new TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Write a description about Event',
                        labelText: 'Description',
                        helperText: 'Keep it short',
                      ),
                      maxLines: 5,
                      onSaved: (val) => hv.description = val,
                    ),
                    
                    SizedBox(height: 24.0),
                    new FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.work),
                            labelText: 'EventType',
                          ),
                          isEmpty: _type == '',
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton(
                              value: _type,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  // newContact.favoriteColor = newValue;
                                  _type = newValue;
                                  state.didChange(newValue);
                                });
                              },
                              items: _types.map((String value) {
                                return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                    new Container(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 20.0, right: 10.0),
                        child: new RaisedButton(
                          child: const Text('Create'),
                          onPressed: _submitform,
                        )),
                  ],
                ))),
      ),
    );
  }

  void _submitform() {
    final FormState form = _formKey.currentState;

    form.save(); //This invokes each onSaved event
    print('Submitting to back end...');
    _add();
    print('Going to home...');
     Navigator.pushNamed(context, Uidata.event_space);
  
}
}
class HelpValues {
  String name;
  String email;
  String description;
  String organisation = '';
  String title;
  String location;
  String secret_key_string;

  String type = '';
}
