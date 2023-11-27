import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:bucketlist/utils/Routes/route_names.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class BottomBar extends StatefulWidget {
  final MotionTabBarController? controller;
  const BottomBar({super.key, required this.controller});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return (MotionTabBar(
      controller: widget.controller,
      initialSelectedTab: "Projects",
      labels: const ["Update", "Projects", "Members"],
      icons: [Icons.message, Icons.playlist_add, Icons.groups],
      tabSelectedColor: ColorsClass.purp,
      tabBarColor: ColorsClass.darkGrey,
      textStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: Colors.white,
      onTabItemSelected: (int value) {
        widget.controller!.index = value;
      },
    ));
    // return Container(
    //     color: ColorsClass.darkGrey,
    //     height: 80,
    //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    //       GestureDetector(
    //         onTap: () {
    //           widget.controller.animateToPage(0,
    //               duration: Duration(milliseconds: 300),
    //               curve: Curves.easeInOut);
    //         },
    //         child: const Icon(Icons.message, color: Colors.white),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           widget.controller.animateToPage(1,
    //               duration: Duration(milliseconds: 300),
    //               curve: Curves.easeInOut);
    //         },
    //         child: const Icon(Icons.playlist_add, color: Colors.white),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           widget.controller.animateToPage(2,
    //               duration: Duration(milliseconds: 300),
    //               curve: Curves.easeInOut);
    //         },
    //         child: const Icon(Icons.groups, color: Colors.white),
    //       ),
    //     ]));
  }
}

enum _SelectedTab { groups, publish, search, person }
