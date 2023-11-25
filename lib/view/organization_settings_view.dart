import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screen.dart';
import 'package:bucketlist/view_model/login_view_model.dart';
import 'package:bucketlist/utils/widgets/membercard.dart';
import 'package:flutter/material.dart';

class OrgSettings extends StatefulWidget {
  const OrgSettings({Key? key, required String orgUid}) : super(key: key);

  @override
  State<OrgSettings> createState() => _OrgSettingsScreenState();
}

class _OrgSettingsScreenState extends State<OrgSettings>
    with TickerProviderStateMixin {
  bool isChipVisible = true;
  late TabController _tabController;
  bool showAllMembers = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
      appBar: AppBar(
        backgroundColor: GlobalTheme.background,
        foregroundColor: GlobalTheme.foreground,
      ),

      backgroundColor: GlobalTheme.background,

      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil.screenHeight(context) * 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Community Banner
              Container(
                height: ScreenUtil.screenHeight(context) * (1 / 5),
                decoration: const BoxDecoration(
                  color: GlobalTheme.accent,
                  image: DecorationImage(
                    image: AssetImage('assets/banner_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // Community Avatar
                child: Align(
                  alignment: const Alignment(-.9, 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Container(
                      height: ScreenUtil.screenHeight(context) * (1 / 6.6),
                      width: ScreenUtil.screenWidth(context) * (1 / 3),
                      color: const Color(0xffFF0E58),
                      child: const Icon(Icons.group,
                          color: Colors.white, size: 50.0),
                    ),
                  ),
                ),
              ),
              // Spacing to account for community avatar offset
              SizedBox(
                width: ScreenUtil.screenWidth(context),
                height: ScreenUtil.screenHeight(context) * (1 / 13.3),
              ),
              // Community Name
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
                    // Community Description
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
              // Tags Heading
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
              // Tags Paintchips
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
                          labelStyle:
                              const TextStyle(color: GlobalTheme.accent),
                          onPressed: () {
                            setState(() {
                              isChipVisible = false;
                            });
                          }),
                    ),
                  ),
                ],
              ),
// Tabs
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Members'),
                        Tab(text: 'Join Requests'),
                      ],
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      labelColor: GlobalTheme.accent,
                      unselectedLabelColor: GlobalTheme.darkAccent,
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.only(left: 15, right: 30),
                      automaticIndicatorColorAdjustment: false,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Members Tab
                          // Members Tab
                          Container(
                            child: FutureBuilder<List<dynamic>>(
                              future: getmembers(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Use null-aware operator to handle the case when snapshot.data is null
                                  final List<dynamic> members =
                                      snapshot.data ?? [];

                                  // Display either all members or at most two members based on the showAllMembers variable
                                  final List<MembersCard> displayedMembers =
                                      showAllMembers
                                          ? members
                                              .map((member) => MembersCard(
                                                  content: members,
                                                  index:
                                                      members.indexOf(member)))
                                              .toList()
                                          : members
                                              .take(2)
                                              .map((member) => MembersCard(
                                                  content: members,
                                                  index:
                                                      members.indexOf(member)))
                                              .toList();

                                  // Check if there are more than two members
                                  final bool hasMoreMembers =
                                      members.length > 2;

                                  return SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Displayed member cards
                                        ...displayedMembers,

                                        // Display the button if there are more members
                                        if (hasMoreMembers)
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: TextButton(
                                              onPressed: () {
                                                // Update the state variable to toggle between showing all members and just two members
                                                setState(() {
                                                  showAllMembers =
                                                      !showAllMembers;
                                                });
                                              },
                                              child: Icon(showAllMembers
                                                  ? Icons.expand_less
                                                  : Icons.expand_more),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ), // Join Requests Tab
                          Container(
                            child: FutureBuilder<List<dynamic>>(
                              future: getmembers(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Visibility Setting
              GestureDetector(
                onTap: () {
                  print("hello");
                },
                child: Container(
                  color: GlobalTheme.backWidget,
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 10, right: 15),
                  width: ScreenUtil.screenWidth(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visibility',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Set server visibility to Open, Closed, Request only.',
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          )
                        ],
                      ),
                      Icon(Icons.visibility,
                          color: GlobalTheme.foreground, size: 22)
                    ],
                  ),
                ),
              ),
              // Manage roles setting
              const SizedBox(height: 2),
              GestureDetector(
                onTap: () {
                  print("hello");
                },
                child: Container(
                  color: GlobalTheme.backWidget,
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 10, right: 15),
                  width: ScreenUtil.screenWidth(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manage Roles',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Create, Edit and Delete roles',
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          )
                        ],
                      ),
                      Icon(Icons.label_important,
                          color: GlobalTheme.foreground, size: 22)
                    ],
                  ),
                ),
              ),
              // Assign tasks setting
              const SizedBox(height: 2),
              GestureDetector(
                onTap: () {
                  print("hello");
                },
                child: Container(
                  color: GlobalTheme.backWidget,
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 10, right: 15),
                  width: ScreenUtil.screenWidth(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Assign Roles',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Filter by roles and assign tasks',
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          )
                        ],
                      ),
                      Icon(Icons.check_outlined,
                          color: GlobalTheme.foreground, size: 22)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
