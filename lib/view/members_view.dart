import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screendat.dart';
import 'package:bucketlist/utils/widgets/membercard.dart';
import 'package:bucketlist/utils/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class MembersScreen extends StatefulWidget {
  MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.screenHeight(context),
      width: ScreenUtil.screenWidth(context),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 2, 15, 15),
              child: Text(
                "Members",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: ScreenUtil.screenHeight(context) * 0.05,
                  width: ScreenUtil.screenHeight(context) * 0.05,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                      onPressed: () {},
                      child: const Center(child: Icon(Icons.filter_alt))),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: ColorsClass.textfcolor),
                  height: ScreenUtil.screenHeight(context) * 0.05,
                  width: ScreenUtil.screenHeight(context) * 0.38,
                  child: const TextField(
                    decoration: InputDecoration(
                        labelText: 'Search', border: InputBorder.none),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                  height: ScreenUtil.screenHeight(context) * 0.8,
                  width: ScreenUtil.screenWidth(context),
                  color: ColorsClass.black,
                  child: ListView.builder(
                      itemCount: 10, // Temp count change on api call
                      itemBuilder: (context, index) {
                        return MembersCard();
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
