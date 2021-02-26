import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/pages/exercise1/contacts_page.dart';
import 'package:flutter_application_2/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: getRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        final defaultRoute = MaterialPageRoute(
          builder: (BuildContext context) => ContactsPage()
        );
        return defaultRoute;
      },
    );
  }
}