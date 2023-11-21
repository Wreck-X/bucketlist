import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:bucketlist/utils/Routes/route_names.dart';

class BottomBar extends StatefulWidget {
  final PageController controller;
  const BottomBar({super.key, required this.controller});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsClass.darkGrey,
        height: 80,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
            onTap: () {
              widget.controller.animateToPage(0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: const Icon(Icons.message, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              widget.controller.animateToPage(1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: const Icon(Icons.playlist_add, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              widget.controller.animateToPage(2,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: const Icon(Icons.groups, color: Colors.white),
          ),
        ]));
  }
}

enum _SelectedTab { groups, publish, search, person }
