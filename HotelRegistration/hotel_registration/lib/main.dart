import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();      //firebase init
  await Firebase.initializeApp(
    name: 'firebase',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Castaway Resort',

      home: homePage(),

      routes: {
        '0': (context)=> homePage(),
      },
    );
  }
}