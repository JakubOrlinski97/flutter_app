import 'package:cloud_firestore/cloud_firestore.dart';

class Author {
  String name;

  DocumentReference reference;

  Author({this.name});

  factory Author.fromJson(Map<String, String> json) {
    return Author(name: json["name"]);
  }

  factory Author.fromSnapshot(DocumentSnapshot snapshot) {
    Author newAuthor = Author.fromJson(snapshot.data());
    newAuthor.reference = snapshot.reference;
    return newAuthor;
  }

  Map<String, dynamic> toJson(Author instance) => <String, dynamic>{
        'name': instance.name,
      };
}
