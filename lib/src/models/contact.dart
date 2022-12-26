import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// final String db='contact';
//============================== Controller =============================
// Create Contact
Future CreateContact(Contact contact) async {
  // Call Firebase
  final docContact = FirebaseFirestore.instance.collection('contact').doc();

  contact.id = docContact.id;

  final json = contact.toJson();
  await docContact.set(json);
}

// List Contact
Stream<List<Contact>> readContacts() {
  return FirebaseFirestore.instance.collection('contact').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => Contact.fromJson(doc.data())).toList());
}

// Update

Future UpdateContact(Contact contact, String id) async {
  // print(id);
  final docContact = FirebaseFirestore.instance.collection('contact').doc(id);

  // contact.id = docContact.id;
  final json = contact.toJson();
  await docContact.update(json);
}
//================= End Controller =======================================

// Model Contact
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

  static Contact fromJson(Map<String, dynamic> json) => Contact(
      first_name: json['first_name'],
      last_name: json['last_name'],
      phone_number: json['phone_number'],
      email: json['email']);
}
