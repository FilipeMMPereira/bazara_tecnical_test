// ignore_for_file: prefer_const_constructors

import 'package:bazara_tecnical_test/src/components/MyDrowerList.dart';
import 'package:bazara_tecnical_test/src/components/MyHeaderDrower.dart';
import 'package:bazara_tecnical_test/src/pages/contact/CreateContactPage.dart';
import 'package:flutter/material.dart';

class IndexContactPage extends StatefulWidget {
  const IndexContactPage({super.key});

  @override
  State<IndexContactPage> createState() => _IndexContactPageState();
}

class _IndexContactPageState extends State<IndexContactPage> {
  @override
  Widget build(BuildContext context) {
    // bloc.getListContact();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: StreamBuilder(
          // stream: bloc.buttonSearchOut,
          builder: (conext, snapshot) {
            // if (snapshot.hasError) {
            //   print(snapshot.error);
            //   return Text('Error: ${snapshot.error}');
            // } else {
            //   if (!snapshot.hasData) {
            //     return Center(child: CircularProgressIndicator());
            //   }

            // if (snapshot.data) {
            //   return AppBar(
            //     title: appBarTitle,
            //     backgroundColor: color,
            //     actions: <Widget>[
            //       IconButton(
            //         icon: actionIcon,
            //         onPressed: () {
            //           setState(() {
            //             if (this.actionIcon.icon == Icons.search) {
            //               this.actionIcon = new Icon(
            //                 Icons.close,
            //                 color: Colors.indigo,
            //               );
            //               this.color = Colors.white;
            //               this.appBarTitle = new TextField(
            //                 controller: _cSearch,
            //                 style: new TextStyle(
            //                   color: Colors.indigo,
            //                 ),
            //                 autofocus: true,
            //                 onChanged: (value) {
            //                   this.searching = true;
            //                   bloc.getListBySearch(value);
            //                 },
            //                 decoration: new InputDecoration(
            //                     prefixIcon: new Icon(Icons.search,
            //                         color: Colors.indigo),
            //                     hintText: "Pesquisar contatos",
            //                     hintStyle:
            //                         new TextStyle(color: Colors.indigo)),
            //               );
            //             } else {
            //               _cSearch.clear();
            //               this.searching = false;
            //               this.actionIcon = new Icon(
            //                 Icons.search,
            //               );
            //               this.color = Colors.indigo;
            //               this.appBarTitle = new Text("Contatos");
            //               // bloc.getListContact();
            //             }
            //           });
            //         },
            //       ),
            //     ],
            //   );
            // } else {
            return AppBar(
              title: Text("Contatos"),
            );
            // }
            // }
          },
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
          child: Column(children: [MyHeaderDrower(), MyDrowerList()]),
        )),
      ),
      body: StreamBuilder(
        // stream: bloc.listContactOut,
        builder: (context, snapshot) {
          // if (!snapshot.hasData) {
          //   return Center(child: CircularProgressIndicator());
          // }

          // if (snapshot.hasError) {
          //   print(snapshot.error);
          //   return Text('Error: ${snapshot.error}');
          // } else {
          // bloc.setVisibleButtonSearch(snapshot.data.length > 0 || searching);

          // if (searching && snapshot.data.length == 0) {
          return Column(
            children: <Widget>[
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Nenhum contato localizado"),
              )),
            ],
          );
          // } else {
          //   return ContactList(items: snapshot.data);
          // }
          // }
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
}
