import 'package:bucketlist/utils/widgets/bottombar.dart';
import 'package:bucketlist/utils/widgets/statuscard.dart';
import 'package:bucketlist/view/members_view.dart';
import 'package:flutter/material.dart';
import '../resources/colors.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

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
              Container(
                height: 90,
                color: ColorsClass.purp,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push<void>(SwipeablePageRoute(
                    // You can customize the width of the detection area with
                    // `backGestureDetectionWidth`.
                    builder: (_) => MembersScreen(),
                  ));
                },
                child: const Text('Open page 3'),
              ),
              Expanded(
                child: Container(
                    color: ColorsClass.black,
                    child: ListView.builder(
                        itemCount: 10, // Temp count change on api call
                        itemBuilder: (context, index) {
                          return StatusCard();
                        })),
              )
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(child: BottomBar()));
  }
}
