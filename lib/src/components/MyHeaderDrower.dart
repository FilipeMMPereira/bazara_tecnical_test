import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHeaderDrower extends StatefulWidget {
  const MyHeaderDrower({super.key});

  @override
  State<MyHeaderDrower> createState() => _MyHeaderDrowerState();
}

class _MyHeaderDrowerState extends State<MyHeaderDrower> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 1, 154, 231),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(user.photoURL!))),
        ),
        Text(
          user.displayName!,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          user.email!,
          style: TextStyle(color: Colors.grey[200], fontSize: 14),
        )
      ]),
    );
  }
}
