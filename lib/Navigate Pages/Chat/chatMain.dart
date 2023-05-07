import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_care_system/Navigate%20Pages/Chat/chatLogin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDU7n9yslG-Guvv0AwcfMcpIWp4m4iyD0M",
        appId: "1:976041081091:web:c2050bc812ac51085e9136",
        messagingSenderId: "976041081091",
        projectId: "new-life-plus-health",
      ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      theme: ThemeData(
        primaryColor: Colors.orange[900],
      ),
      home: ChatLoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
