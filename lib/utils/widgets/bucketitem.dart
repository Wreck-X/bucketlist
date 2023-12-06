import 'package:flutter/material.dart';
import '../../utils/Routes/route_names.dart';
import '../../resources/colors.dart';

class BucketItem extends StatefulWidget {
  BucketItem({Key? key, required this.data, required this.index})
      : super(key: key);
  var data;
  var index;
  @override
  State<BucketItem> createState() => _BucketItemState();
}

class _BucketItemState extends State<BucketItem> {
  bool boolean = false; // Move the variable here to maintain its state.

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    var entry = widget.data['projects'][widget.index].entries;
    var name;
    var tasks;
    for (var i in entry) {
      name = i.value['name'];
    }
    print('test $name ');
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(RouteNames.project);
        },
        child: Card(
          color: GlobalTheme.backWidget,
          child: Row(
            children: [
              Checkbox(
                value: boolean,
                onChanged: (value) {
                  setState(() {
                    boolean = value ?? false;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  name ?? 'Unnamed Project',
                  style: const TextStyle(color: GlobalTheme.foreground),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
