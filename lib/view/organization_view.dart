import 'package:bucketlist/repositories/my_orgs.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../utils/constants.dart';
import '../utils/widgets/cards.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    List fetchedData = await org_repo.fetchData();
    setState(() {
      servers = fetchedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate number of columns based on screen width
    double width = MediaQuery.of(context).size.width;
    int columns = (width / 250).floor();
    columns = columns >= 2 ? columns : 2; // Ensure a minimum of 2 columns

    return Scaffold(
      appBar: AppBar(
        title: const Text('Organizations',
            style: TextStyle(color: GlobalTheme.foreground)),
        backgroundColor: GlobalTheme.background,
        iconTheme: IconThemeData(color: GlobalTheme.foreground),
        foregroundColor: GlobalTheme.foreground,
      ),
      backgroundColor: GlobalTheme.background,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'tags',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) => ImageCard(name: servers[index]["name"]!, org_uid: servers[index]["id"]!),
              itemCount: servers.length, // Set itemCount to the length of the names list
            ),
          ),
        ],
      ),
    );
  }
}
