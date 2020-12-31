import 'package:flutter/material.dart';
import 'package:peruvian_identifier/ui/company.page.dart';
import 'package:peruvian_identifier/ui/person.page.dart';

const String initialRoute = "splash";

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => PersonPage());
      case 'person':
        return MaterialPageRoute(builder: (_) => PersonPage());
      case 'company':
        return MaterialPageRoute(builder: (_) => CompanyPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
