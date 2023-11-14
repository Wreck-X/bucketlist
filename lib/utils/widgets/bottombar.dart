import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:bucketlist/utils/Routes/route_names.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    var _selectedTab = _SelectedTab.groups;

    void _handleIndexChanged(int i) {
      setState(() {
        _selectedTab = _SelectedTab.values[i];
      });
    }

    return Container(
        color: ColorsClass.darkGrey,
        height: 80,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RouteNames.status);
            },
            child: const Icon(Icons.message, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RouteNames.projects);
            },
            child: const Icon(Icons.playlist_add, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RouteNames.members);
            },
            child: const Icon(Icons.groups, color: Colors.white),
          ),
        ]));
  }
}

enum _SelectedTab { groups, publish, search, person }
