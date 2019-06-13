import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class createjob extends StatefulWidget {
  @override
  _createjobState createState() => _createjobState();
}

class _createjobState extends State<createjob> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>[
    '',
    'FullTime',
    'PartTime',
    'RemoteOK',
    'Testing'
  ];
  String _color = '';
  JobValues jb = new JobValues();
  StreamSubscription<DocumentSnapshot> subscription;
  final DocumentReference documentReference =
      Firestore.instance.document("eventdata/${count}");
  static int count = 5;
  String oneAsString = count.toString();

  void _add() {
    Map<String, String> data = <String, String>{
      "name": "${jb.title}",
      "desc": "${jb.description}",
      "location": "${jb.organisation}",
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
    count = count + 1;
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
                        icon: const Icon(Icons.person),
                        hintText: 'Enter Job title',
                        labelText: 'Job Title',
                      ),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(30)
                      ],
                      onSaved: (val) => jb.title = val,
                    ),
                    SizedBox(height: 24.0),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.home),
                        hintText: 'Enter the name of your organisation',
                        labelText: 'Organisation',
                      ),
                      onSaved: (val) => jb.organisation = val,
                    ),
                    SizedBox(height: 24.0),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your first and last name',
                        labelText: 'Your Name',
                      ),
                      onSaved: (val) => jb.name = val,
                    ),
                    SizedBox(height: 24.0),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Enter a email address',
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (val) => jb.email = val,
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
                      onSaved: (val) => jb.description = val,
                    ),
                    SizedBox(height: 24.0),
                    new FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.work),
                            labelText: 'JobType',
                          ),
                          isEmpty: _color == '',
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton(
                              value: _color,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  // newContact.favoriteColor = newValue;
                                  _color = newValue;
                                  state.didChange(newValue);
                                });
                              },
                              items: _colors.map((String value) {
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
  }
}

class JobValues {
  String name;
  String email;
  String description;
  String organisation = '';
  String title;
  String location;
  String favoriteColor = '';
}
