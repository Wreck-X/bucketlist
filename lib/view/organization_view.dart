import 'package:flutter/material.dart';

import '../utils/widgets/cards.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    // Calculate number of columns based on screen width
    double width = MediaQuery.of(context).size.width;
    int columns = (width / 250).floor();
    columns = columns >= 2 ? columns : 2; // Ensure a minimum of 2 columns

    return Scaffold(
      appBar: AppBar(title: Text('Organizations')),
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
              itemBuilder: (context, index) => ImageCard(),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
