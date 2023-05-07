import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care_system/Navigate%20Pages/Chat/chatLogin.dart';
import 'package:health_care_system/Navigate%20Pages/home_page.dart';
import 'package:health_care_system/Navigate%20Pages/profile_page.dart';
import 'package:health_care_system/Navigate%20Pages/settings_page.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {

  final user = FirebaseAuth.instance.currentUser!;
  final items =<Widget>[
    Icon(Icons.home,color: Colors.white,size: 30),
    Icon(Icons.person_pin_circle_rounded,color: Colors.white,size: 30),
    Icon(Icons.chat_bubble,color: Colors.white,size: 30),
    Icon(Icons.settings,color: Colors.white,size: 30),
  ];
  int index=2;
  final screens=[
    HomeDashboard(),
    ProflePage(),
    ChatLoginPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.teal.shade50,
        color: Colors.teal.shade200,
        animationDuration: Duration(microseconds: 500),
        index: index,
        onTap: (index) => setState(()=> this.index =index),
        items: items
      ),
      /*
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
          )),*/
    );
  }
}
