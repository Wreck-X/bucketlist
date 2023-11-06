import 'package:bucketlist/resources/screendat.dart';
import 'package:flutter/material.dart';

class MembersScreen extends StatefulWidget {
  MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeight(context),
      width: ScreenUtil.screenWidth(context),
      child: Placeholder(),
    );
  }
}
