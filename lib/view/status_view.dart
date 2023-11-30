import 'package:bucketlist/resources/screen.dart';
import 'package:bucketlist/utils/Routes/route_names.dart';
import 'package:bucketlist/utils/widgets/statuscard.dart';
import 'package:bucketlist/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../resources/colors.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  bool _isloaded = false;

  @override
  void initState() {
    super.initState();


    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isloaded = true;
      });
    });
  }

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
                    if (snapshot.hasError) {
                      // If there's an error, display an error message
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return _isloaded
                          ? ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return StatusCard(
                                  content: snapshot.data,
                                  index: index,
                                );
                              },
                            )
                          : loadingShimer();
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
              ;
            },
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
  }

  loadingShimer() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(children: [
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.96,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 20,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor:
                                const Color.fromARGB(255, 123, 123, 123),
                            child: const Icon(
                              Icons.person,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor:
                              const Color.fromARGB(255, 123, 123, 123),
                          child: Container(
                            height: 10,
                            width: 40,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Color.fromARGB(255, 123, 123, 123),
                          child: const Icon(
                            Icons.pending_outlined,
                            color: Colors.yellow,
                            size: 30,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Shimmer.fromColors(
                          highlightColor:
                              const Color.fromARGB(255, 123, 123, 123),
                          baseColor: Colors.grey[300]!,
                          child: Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ]),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor:
                              const Color.fromARGB(255, 123, 123, 123),
                          child: const Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor:
                            const Color.fromARGB(255, 123, 123, 123),
                        child: Container(
                          height: 10,
                          width: 100,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]);
        });
  }
}
