import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screen.dart';
import 'package:flutter/material.dart';
import '../utils/widgets/cards.dart';

class OrgSettings extends StatefulWidget {
  const OrgSettings({Key? key, required String orgUid}) : super(key: key);

  @override
  State<OrgSettings> createState() => _OrgSettingsScreenState();
}

class _OrgSettingsScreenState extends State<OrgSettings> {
  bool isChipVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: GlobalTheme.background,
          foregroundColor: GlobalTheme.foreground),
      backgroundColor: GlobalTheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ScreenUtil.screenHeight(context) * (1 / 5),
            decoration: const BoxDecoration(
              color: GlobalTheme.accent,
              image: DecorationImage(
                image: AssetImage('assets/banner_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: const Alignment(-.9, 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), //or 15.0
                child: Container(
                  height: ScreenUtil.screenHeight(context) * (1 / 6.6),
                  width: ScreenUtil.screenWidth(context) * (1 / 3),
                  color: const Color(0xffFF0E58),
                  child:
                      const Icon(Icons.group, color: Colors.white, size: 50.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil.screenWidth(context),
            height: ScreenUtil.screenHeight(context) * (1 / 13.3),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Virgil Markus',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'This is a community for hardcore gamers',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Tags ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Icon(
                    Icons.add_box,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Visibility(
                  visible: isChipVisible,
                  child: ActionChip(
                      backgroundColor: GlobalTheme.background,
                      side: const BorderSide(color: GlobalTheme.accent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      label: Row(children: [
                        const Text('Gaming'),
                        GestureDetector(
                            onTap: () {},
                            child: const Padding(
                                padding: EdgeInsets.only(left: 2),
                                child: Icon(Icons.close,
                                    color: GlobalTheme.accent, size: 12)))
                      ]),
                      labelStyle: const TextStyle(color: GlobalTheme.accent),
                      onPressed: () {
                        setState(() {
                          isChipVisible = false;
                        });
                      }),
                ),
              ),
            ],
          ),


GestureDetector(
onTap: () {
    print("hello");
},
child: Container(
  color: GlobalTheme.backWidget,
  padding: const EdgeInsets.only(left: 15, top: 10, bottom:10, right:15),
  width: ScreenUtil.screenWidth(context),
    child: const Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Column ( crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text(
      'Visibility',
      style: TextStyle(fontSize: 18.0, color: Colors.white),
    ), SizedBox(height:4),Text('Set server visibility to Open, Closed, Request only.',
        style: TextStyle(fontSize: 13.0, color: Colors.white),
    )],
    ),Icon(Icons.visibility, color:GlobalTheme.foreground,size:22)],),
  ),
),
SizedBox(height:2),

GestureDetector(
onTap: () {
    print("hello");
},
child: Container(
  color: GlobalTheme.backWidget,
  padding: const EdgeInsets.only(left: 15, top: 10, bottom:10, right:15),
  width: ScreenUtil.screenWidth(context),
    child: const Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Column ( crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text(
      'Manage Roles',
      style: TextStyle(fontSize: 18.0, color: Colors.white),
    ), SizedBox(height:4),Text('Create, Edit and Delete roles',
        style: TextStyle(fontSize: 13.0, color: Colors.white),
    )],
    ),Icon(Icons.label_important, color:GlobalTheme.foreground,size:22)],),
  ),
),
SizedBox(height:2),


GestureDetector(
onTap: () {
    print("hello");
},
child: Container(
  color: GlobalTheme.backWidget,
  padding: const EdgeInsets.only(left: 15, top: 10, bottom:10, right:15),
  width: ScreenUtil.screenWidth(context),
    child: const Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Column ( crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text(
      'Manage Roles',
      style: TextStyle(fontSize: 18.0, color: Colors.white),
    ), SizedBox(height:4),Text('Create, Edit and Delete roles',
        style: TextStyle(fontSize: 13.0, color: Colors.white),
    )],
    ),Icon(Icons.check_outlined, color:GlobalTheme.foreground,size:22)],),
  ),
),

        ],
      ),
    );
  }
}
