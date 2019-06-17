import 'package:cloud_firestore/cloud_firestore.dart';

class JoblistModel {
  final DocumentReference reference;
  String name;
  String desc;
  String location;
  String id;
  String secret_key;
  

  JoblistModel.data(this.reference,
      [this.name,
        this.desc,
        this.location,
        this.id,
        this.secret_key,
        ]) {
    // Set these rather than using the default value because Firebase returns
    // null if the value is not specified.
    this.name ??= 'Deepak';
    this.desc ??= 'Flutter Developer';
    this.location ??= 'Delhi';
    this.id ??= '7';
    this.secret_key ??= '7';
  }

  factory JoblistModel.from(DocumentSnapshot document) => JoblistModel.data(
      document.reference,
      document.data['name'],
      document.data['desc'],
      document.data['location'],
      document.data['id'],
      document.data['secret_key'],
      );

  void save() {
    reference.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'location': location,
      'id':id,
      'secret_key':secret_key,
    };
  }
}
