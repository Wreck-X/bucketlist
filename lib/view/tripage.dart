import 'package:bucketlist/view/members_view.dart';
import 'package:bucketlist/view/organization_view.dart';
import 'package:bucketlist/view/projects_view.dart';
import 'package:bucketlist/view/status_view.dart';
import 'package:flutter/material.dart';

class TriPage extends StatefulWidget {
  TriPage({Key? key}) : super(key: key);

  @override
  _TriPageState createState() => _TriPageState();
}

class _TriPageState extends State<TriPage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: PageView(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: controller,
        children: const <Widget>[
          Center(
            child: StatusScreen(),
          ),
          Center(
            child: OrganizationScreen(),
          ),
          Center(
            child: MembersScreen(),
          ),
        ],
      ),
    );
  }
}
