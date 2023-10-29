import 'package:bucketlist/view/organization_view.dart';
import 'package:bucketlist/view/project_view.dart';

import '../../utils/Routes/route_names.dart';
import '../../view/login_view.dart';
import '../../view/signup_view.dart';
import '../../view/projects_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const OrganizationScreen());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RouteNames.organizations:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RouteNames.projects:
        return MaterialPageRoute(builder: (_) => const ProjectsScreen());
      case RouteNames.project:
        return MaterialPageRoute(builder: (_) => const ProjectScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
