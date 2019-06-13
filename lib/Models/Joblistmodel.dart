import 'package:cloud_firestore/cloud_firestore.dart';

class JoblistModel {
  final DocumentReference reference;
  String name;
  String desc;
  String location;
  

  JoblistModel.data(this.reference,
      [this.name,
        this.desc,
        this.location]) {
    // Set these rather than using the default value because Firebase returns
    // null if the value is not specified.
    this.name ??= 'Deepak';
    this.desc ??= 'Flutter Developer';
    this.location ??= 'Delhi';
  }

  factory JoblistModel.from(DocumentSnapshot document) => JoblistModel.data(
      document.reference,
      document.data['name'],
      document.data['desc'],
      document.data['location'],
      );

  void save() {
    reference.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'location': location,
    };
  }
}
