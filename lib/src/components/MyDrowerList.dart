// ignore_for_file: prefer_const_constructors

import 'package:bazara_tecnical_test/src/provider/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class MyDrowerList extends StatefulWidget {
  const MyDrowerList({super.key});

  @override
  State<MyDrowerList> createState() => _MyDrowerListState();
}

class _MyDrowerListState extends State<MyDrowerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [MenuItem()]),
    );
  }

  Widget MenuItem() {
    return Material(
      child: InkWell(
        onTap: () async {
          // bool saiu = await sair();
          // if (saiu) {
          //   Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => VerifyAuth(),
          //       ));
          // }
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.logout();
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                  child: Icon(
                Icons.exit_to_app,
                size: 20,
              )),
              Expanded(
                flex: 3,
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<bool> sair() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.clear();
  //   return true;
  // }
}
