import 'package:flutter/material.dart';
import 'widgets/principal.dart';
import 'widgets/imc.dart';
import 'widgets/Sueldo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      actions: WidgetsApp.defaultActions,
      title: 'App Rubrica',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: const Test(),
      initialRoute: '/principal',
      routes: {
        '/principal':(context) => const Principal(),
        '/Imc':(context) => const Imc(),
        '/Sueldo':(context) => const Sueldo(),
      },
    );
  }
}