import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:bucketlist/resources/screendat.dart';

class SendStatus extends StatefulWidget {
  const SendStatus({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SendStatusState createState() => _SendStatusState();
}

class _SendStatusState extends State<SendStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.black,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorsClass.textfcolor),
                height: ScreenUtil.screenHeight(context) * 0.07,
                width: ScreenUtil.screenHeight(context),
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'Update', border: InputBorder.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: ScreenUtil.screenWidth(context) * 0.25,
                      height: ScreenUtil.screenHeight(context) * 0.04,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(25, 149, 31, 253),
                          border: Border.all(
                              color: const Color.fromARGB(255, 155, 39, 176))),
                      child: const Center(
                        child: Text(
                          "Flair",
                          style: TextStyle(color: ColorsClass.purp),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: ScreenUtil.screenWidth(context) * 0.25,
                      height: ScreenUtil.screenHeight(context) * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(25, 241, 206, 80),
                        border: Border.all(
                            color: const Color.fromARGB(255, 241, 206, 80)),
                      ),
                      child: const Center(
                        child: Text(
                          "Tag",
                          style: TextStyle(color: ColorsClass.yellow),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorsClass.textfcolor),
                height: ScreenUtil.screenHeight(context) * 0.05,
                width: ScreenUtil.screenHeight(context),
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'Search', border: InputBorder.none),
                ),
              ),
            ]),
          ),
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
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
