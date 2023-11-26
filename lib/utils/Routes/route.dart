import 'package:bucketlist/view/sendupdate_view.dart';
import 'package:bucketlist/view/statistics.dart';
import 'package:bucketlist/view/tripage_view.dart';
import '../../utils/Routes/route_names.dart';
import '../../view/edit_project_view.dart';
import '../../view/login_view.dart';
import '../../view/organization_view.dart';
import '../../view/organization_settings_view.dart';
import '../../view/project_view.dart';
import '../../view/signup_view.dart';
import '../../view/projects_view.dart';
import '../../view/status_view.dart';
import '../../view/members_view.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.tripage:
        return MaterialPageRoute(builder: (_) => TriPage(org_uid: ''));
      case RouteNames.statistics:
        return MaterialPageRoute(builder: (_) => StatisticScreen());
      case RouteNames.members:
        return SwipeablePageRoute(builder: (_) => MembersScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.status:
        return SwipeablePageRoute(builder: (_) => const StatusScreen());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RouteNames.organizations:
        return MaterialPageRoute(builder: (_) => const OrganizationScreen());
      case RouteNames.sendupdate:
        return MaterialPageRoute(builder: (_) => SendStatus());
      case RouteNames.projects:
        return MaterialPageRoute(
            builder: (_) => const ProjectsScreen(
                  org_uid: '',
                ));
      case RouteNames.project:
        return MaterialPageRoute(builder: (_) => const ProjectScreen());
      case RouteNames.editProject:
        return MaterialPageRoute(builder: (_) => const EditProjectScreen());
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
