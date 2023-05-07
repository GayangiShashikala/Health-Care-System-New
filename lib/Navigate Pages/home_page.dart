import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signed In as:' + user.email!),
              MaterialButton(onPressed: (){
                FirebaseAuth.instance.signOut();
              },
                color: Colors.deepPurple[200],
                child: Text('Sign Out'),
              )
            ],
          )
      ),
    );
  }
}
