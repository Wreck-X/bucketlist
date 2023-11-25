import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screendat.dart';
import 'package:bucketlist/utils/widgets/membercard.dart';
import 'package:bucketlist/view_model/login_view_model.dart';
import 'package:flutter/material.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeight(context),
      width: ScreenUtil.screenWidth(context),
      child: Scaffold(
        backgroundColor: ColorsClass.black,
        body: SafeArea(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: ScreenUtil.screenHeight(context) * 0.05,
                      width: ScreenUtil.screenHeight(context) * 0.048,
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorsClass.purp,
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                          icon: Icon(
                            Icons.filter_alt,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
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
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  height: ScreenUtil.screenHeight(context) * 0.8,
                  width: ScreenUtil.screenWidth(context),
                  color: ColorsClass.black,
                  child: FutureBuilder<List<dynamic>>(
                    future: getmembers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While waiting for data, return a loading indicator or placeholder
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        // If there's an error, display an error message
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // If data is successfully fetched, use ListView.builder
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return MembersCard(
                              content: snapshot.data,
                              index: index,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
