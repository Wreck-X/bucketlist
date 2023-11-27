import 'package:bucketlist/utils/widgets/bottombar.dart';
import 'package:bucketlist/view/members_view.dart';
import 'package:bucketlist/view/organization_view.dart';
import 'package:bucketlist/view/projects_view.dart';
import 'package:bucketlist/view/status_view.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class TriPage extends StatefulWidget {
  final String org_uid;
  TriPage({Key? key, required this.org_uid}) : super(key: key);

  @override
  _TriPageState createState() => _TriPageState();
}

class _TriPageState extends State<TriPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    MotionTabBarController _motionTabBarController =
        MotionTabBarController(length: 3, vsync: this);
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: TabBarView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          controller: _motionTabBarController,

          children: <Widget>[
            const Center(
              child: StatusScreen(),
            ),
            Center(
              child: ProjectsScreen(org_uid: widget.org_uid),
            ),
            const Center(
              child: MembersScreen(),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(controller: _motionTabBarController),
      ),
    );
  }
}
