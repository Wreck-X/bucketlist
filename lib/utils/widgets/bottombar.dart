import 'package:bucketlist/resources/colors.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

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
      color: ColorsClass.lightblack,
      height: 80,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Icon(Icons.groups,color: Colors.white,),
        Icon(Icons.person, color: Colors.white,),
        Icon(Icons.publish, color: Colors.white ),]
      )
    );
  }
}

enum _SelectedTab { groups, publish, search, person }
