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
                      onTap: () {
                        print("edit icon");
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'This is a community for hardcore gamers',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tags: ',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Text(
            'Gaming, Members',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Members: ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                  child: InkWell(
                    onTap: () {
                      debugPrint('Card $index clicked');
                    },
                    child: Card(
                      color: GlobalTheme.backWidget,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Member $index',
                          style: const TextStyle(color: GlobalTheme.foreground),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: 10,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TappableCard(
                'Visibility: ',
                'Set visibility to open, create, edit, and delete roles',
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TappableCard(
                'Manage Roles: ',
                'Filter by roles and assign tasks',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
