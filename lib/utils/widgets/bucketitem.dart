import 'package:bucketlist/resources/animation.dart';
import 'package:bucketlist/view/project_view.dart';
import 'package:bucketlist/view_model/login_view_model.dart';
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
  var key;
  var name;
  var tasks;
  var completed = false;
  void initState() {
    super.initState();
    var entry = widget.data['projects'][widget.index].entries;

    for (var i in entry) {
      key = i.key;
      name = i.value['name'];
      completed = i.value['completed'];
      tasks = i.value['tasks'];
    }
    // Initialize localBoolean with the initial value from the API
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(FadeRoute(page: ProjectScreen(tasks: tasks)));
        },
        child: Card(
          color: GlobalTheme.backWidget,
          child: Row(
            children: [
              Checkbox(
                value: completed,
                onChanged: (value) {
                  setState(() {
                    completed = !completed;
                    postboolstate(completed, key)
                        .then((value) => (print("posted")));
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
