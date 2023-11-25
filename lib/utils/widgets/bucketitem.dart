import 'package:flutter/material.dart';
import '../../utils/Routes/route_names.dart';
import '../../resources/colors.dart';

class BucketItem extends StatelessWidget {
  BucketItem({Key? key, required this.data, required this.index})
      : super(key: key);
  var data;
  var index;
  @override
  Widget build(BuildContext context) {
    var name = data['projects'][index]['name'];
    print('name $name $index');
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(RouteNames.project);
        },
        child: Card(
          color: GlobalTheme.backWidget,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name ?? 'Unnamed Project', // Display the project name
              style: const TextStyle(color: GlobalTheme.foreground),
            ),
          ),
        ),
      ),
    );
  }
}
