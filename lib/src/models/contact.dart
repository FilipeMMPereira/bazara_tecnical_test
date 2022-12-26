import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future CreateContact(Contact contact) async {
  // Call Firebase
  final docContact = FirebaseFirestore.instance.collection('contact').doc();

  contact.id = docContact.id;

  final json = contact.toJson();
  await docContact.set(json);
}

class Contact {
  String? id;
  final String first_name;
  final String last_name;
  final String phone_number;
  final String email;

  Contact(
      {this.id = '',
      required this.first_name,
      required this.last_name,
      required this.phone_number,
      required this.email});

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': first_name,
        'last_name': last_name,
        'phone_number': phone_number,
        'email': email
      };
}
