import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:st_hack/ui/Uidata.dart';

class createjob extends StatefulWidget {
  @override
  _createjobState createState() => _createjobState();
}

class _createjobState extends State<createjob> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  List<String> _types = <String>[
    'Engingeering',
    'Arts',
    'Design',
    'Social',
    'Communication',
    '',
  ];
  String _type = '';
  JobValues jb = new JobValues();
  StreamSubscription<DocumentSnapshot> subscription;
  final DocumentReference documentReference =
      Firestore.instance.document("eventdata/$count");
  static int count = 8;
  String oneAsString = count.toString();

  void _add() {
    Map<String, String> data = <String, String>{
      "title": "${jb.title}",
      "desc": "${jb.description}",
      "location": "${jb.location}",
      "organisation":"${jb.organisation}",
      "email":"${jb.email}",
      "name":"${jb.name}",
      "event_type":"${jb.type}",
      "secret_key":"${jb.secret_key_string}",
      "id": "${count}",
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
    count = count + 1;
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
                        icon: const Icon(Icons.person),
                        hintText: 'Enter Event title',
                        labelText: 'Event Title',
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
                        hintText: 'Enter your email address',
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
                    new TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a Secret key in string format',
                        labelText: 'Secret Key',
                        helperText: 'Keep it of 5 letter',
                      ),
                      onSaved: (val) => jb.secret_key_string = val,
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
     Navigator.pushNamed(context, Uidata.home);
  }
}

class JobValues {
  String name;
  String email;
  String description;
  String organisation = '';
  String title;
  String location;
  String secret_key_string;

  String type = '';
}
