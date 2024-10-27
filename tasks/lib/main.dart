import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasks/firebase_options.dart';
import 'package:tasks/task.dart';
import 'package:tasks/form.dart';
import 'package:tasks/testing/demo.dart';
import 'package:tasks/testing/demo2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } finally {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/demo',
      routes: {
        '/semo': (BuildContext context) => semo2(),
        '/demo': (BuildContext context) => demo(),
        '/tasks': (BuildContext context) => const Task(),
        '/form': (BuildContext context) => const form(),
      },
    );
  }
}
