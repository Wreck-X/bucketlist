import 'package:bucketlist/resources/screen.dart';
import 'package:bucketlist/utils/Routes/route_names.dart';
import 'package:bucketlist/utils/widgets/statuscard.dart';
import 'package:bucketlist/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import '../resources/colors.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.statistics);
              },
              child: Stack(children: [
                Container(
                  height: ScreenUtil.screenHeight(context) * 0.115,
                  color: ColorsClass.darkGrey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      height: 80,
                      width: ScreenUtil.screenWidth(context) * 0.99,
                      decoration: BoxDecoration(
                          color: ColorsClass.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: ScreenUtil.screenHeight(context) * 0.08,
                              width: ScreenUtil.screenWidth(context) * 0.18,
                              decoration: BoxDecoration(
                                  color: ColorsClass.darkGrey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  "PFP",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                              child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "VIRGIL MARCUS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Members 40/50",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Container(
                color: ColorsClass.black,
                child: FutureBuilder(
                  future: getupdates(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting for data, return a loading indicator or placeholder
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // If there's an error, display an error message
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return (StatusCard(
                            content: snapshot.data,
                            index: index,
                          ));
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              getmembers();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: ColorsClass.purp,
            onPressed: () {
              Navigator.of(context).pushNamed(RouteNames.sendupdate);
            },
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
