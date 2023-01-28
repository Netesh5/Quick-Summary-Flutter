import 'package:flutter/material.dart';
import 'package:quicksummary/data/network/network_service.dart';
import 'package:quicksummary/utils/routes/routes_name.dart';
import 'package:quicksummary/utils/switch_button.dart';
import 'package:quicksummary/view/homepage/homepage.dart';
import 'package:quicksummary/view/homepage/widgets/result.dart';

class Routes {
  static Route<dynamic> GenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homesSreen:
        return MaterialPageRoute(builder: (context) => Homepage());
      case RoutesName.resultScreen:
        return MaterialPageRoute(builder: (context) => ResultScreen());
      default:
        return MaterialPageRoute(builder: ((context) {
          return const Scaffold(
            body: Text("No Routes"),
          );
        }));
    }
  }
}
