import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';
import '../utils/Routes/route_names.dart';
import '../utils/widgets/cards.dart';

class OrgSettings extends StatefulWidget {
  const OrgSettings({Key? key, required String org_uid}) : super(key: key);

  @override
  State<OrgSettings> createState() => _OrgSettingsScreenState();
}

class _OrgSettingsScreenState extends State<OrgSettings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(color: GlobalTheme.foreground)),
        backgroundColor: GlobalTheme.background,
        iconTheme: IconThemeData(color: GlobalTheme.foreground),
        foregroundColor: GlobalTheme.foreground
      ),
      backgroundColor: GlobalTheme.background,
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: GlobalTheme.accent,
              image: DecorationImage(
                image: AssetImage('assets/banner_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: GlobalTheme.darkAccent,
                child: Text(
                  'V',
                  style: TextStyle(
                    color: GlobalTheme.foreground,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Virgil Markus',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          SizedBox(height: 10),
          Text(
            'This is a community for hardcore gamers',
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
                'Tags: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Text(
                'Gaming, Members',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
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
                  color: Colors.white
                ),
              ),
            ],
          ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 10,left: 10),
                child: InkWell(
                  onTap: () {
                    debugPrint('Card $index clicked');
                  },
                  child: Card(
                    color: GlobalTheme.backWidget,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Member $index',
                        style: const TextStyle(color: GlobalTheme.foreground),),
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
                'Visibility: ','Set visibility to open, create, edit, and delete roles',
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TappableCard(
                'Manage Roles: ', 'Filter by roles and assign tasks',
              ),
            ],
          ),
        ],
      ),
    );
  }
}