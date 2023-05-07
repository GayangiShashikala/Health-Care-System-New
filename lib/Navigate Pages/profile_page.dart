import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProflePage extends StatefulWidget {
  const ProflePage({Key? key}) : super(key: key);

  @override
  State<ProflePage> createState() => _ProflePageState();
}

class _ProflePageState extends State<ProflePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget> [
          FutureBuilder(
          future: Provider.of(context).,
      );

        ],
      ),
      /*child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Signed In as:' + user.email!),
              ],
            )
        ),
      ),*/
    );
  }
}
