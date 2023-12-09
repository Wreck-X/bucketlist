import 'package:bucketlist/resources/screen.dart';
import 'package:bucketlist/services/providers.dart';
import 'package:bucketlist/services/statusservices.dart';
import 'package:bucketlist/utils/Routes/route_names.dart';
import 'package:bucketlist/utils/widgets/statuscard.dart';
import 'package:bucketlist/utils/widgets/statuslist.dart';
import 'package:bucketlist/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../resources/colors.dart';

import '../models/statusUpdates/statusUpdates.dart';
import '../services/providers.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final AsyncValue<StatusUpdates> activity =
            ref.watch(statusupdatesProvider);
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
                                  height:
                                      ScreenUtil.screenHeight(context) * 0.08,
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
                  child:
                      Container(color: ColorsClass.black, child: UpdatesList()
                          // if (snapshot.connectionState ==
                          //     ConnectionState.waiting) {
                          //   return loadingShimer();
                          // }
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
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10),
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
      },
    );
  }
}
