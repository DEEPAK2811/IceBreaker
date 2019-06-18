import 'package:cloud_firestore/cloud_firestore.dart';

class HelpListModel {
  final DocumentReference reference;
  String name;
  String desc;
  String email;
  String title;
  String id;

  HelpListModel.data(this.reference,
      [this.name,
        this.desc,
        this.email,
        this.title,
        this.id,
    
        ]) {
    // Set these rather than using the default value because Firebase returns
    // null if the value is not specified.
    this.name ??= 'Deepak';
    this.desc ??= 'Flutter Developer';
    this.email ??= 'deepakprakash2811@gmail.com';
    this.title ??= 'TESTING';
    this.id ??= '7';
    
  }

  factory HelpListModel.from(DocumentSnapshot document) => HelpListModel.data(
      document.reference,
      document.data['name'],
      document.data['desc'],
      document.data['email'],
      document.data['title'],
      document.data['id'],
      
      );

  void save() {
    reference.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'email':email,
      'title':title,
      'id':id,
    };
  }
}
