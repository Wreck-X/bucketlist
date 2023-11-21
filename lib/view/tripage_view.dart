import 'package:bucketlist/utils/widgets/bottombar.dart';
import 'package:bucketlist/view/members_view.dart';
import 'package:bucketlist/view/organization_view.dart';
import 'package:bucketlist/view/projects_view.dart';
import 'package:bucketlist/view/status_view.dart';
import 'package:flutter/material.dart';

class TriPage extends StatefulWidget {
  final String org_uid;
  TriPage({Key? key, required this.org_uid}) : super(key: key);

  @override
  _TriPageState createState() => _TriPageState();
}

class _TriPageState extends State<TriPage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 1);
    return Scaffold(
      body: PageView(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: controller,

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
      bottomNavigationBar: BottomBar(controller: controller),
    );
  }
}
