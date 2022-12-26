// ignore_for_file: prefer_const_constructors

import 'package:bazara_tecnical_test/src/components/MyDrowerList.dart';
import 'package:bazara_tecnical_test/src/components/MyHeaderDrower.dart';
import 'package:bazara_tecnical_test/src/models/contact.dart';
import 'package:bazara_tecnical_test/src/pages/contact/CreateContactPage.dart';
import 'package:bazara_tecnical_test/src/pages/contact/ShowContactPage.dart';
import 'package:flutter/material.dart';

class IndexContactPage extends StatefulWidget {
  const IndexContactPage({super.key});

  @override
  State<IndexContactPage> createState() => _IndexContactPageState();
}

class _IndexContactPageState extends State<IndexContactPage> {
  // HomeBloc bloc;
  Widget appBarTitle = new Text("Contatos");
  Icon actionIcon = new Icon(Icons.search);
  Color color = Colors.indigo;
  bool searching = false;
  final _cSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // bloc.getListContact();
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
          child: Column(children: [MyHeaderDrower(), MyDrowerList()]),
        )),
      ),
      body: StreamBuilder<List<Contact>>(
        stream: readContacts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error: ${snapshot.error}');
          } else {
            // bloc.setVisibleButtonSearch(snapshot.data.length > 0 || searching);

            if (snapshot.data?.length == 0) {
              return Center(
                  child: Text('The contact list is empty',
                      style: TextStyle(fontSize: 15)));
            } else {
              // return ContactList(items: snapshot.data);
              final contacts = snapshot.data!;
              return ListView(
                children: contacts.map(buildContact).toList(),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateContactPage()),
          );
        },
      ),
    );
  }

// Contact
  selected_contact(Contact contact) async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ShowContactPage(
              contact: contact,
            )));

  }

  Widget buildContact(Contact contact) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: ElevatedButton(
          onPressed: () {
            selected_contact(contact);
          },
          child: ListTile(
            leading: CircleAvatar(
                child: Center(
              child: Text(
                  '${contact.first_name.length >= 2 ? contact.first_name.substring(0, 1) : ''} '),
            )),
            title: Text('${contact.first_name} ${contact.last_name}'),
            subtitle: Text(contact.phone_number),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            foregroundColor: Color.fromARGB(255, 99, 99, 99),
            shadowColor: Color.fromARGB(255, 223, 222, 222),
          ),
        ),
      );
}
