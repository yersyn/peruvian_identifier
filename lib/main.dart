import 'package:flutter/material.dart';
import 'package:peruvian_identifier/ui/person.page.dart';
import 'package:peruvian_identifier/ui/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUSCADOR DE PERSONAS Y EMPRESAS DE PERU',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: PersonPage(),
      initialRoute: 'person',
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
