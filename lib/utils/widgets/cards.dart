import 'package:bucketlist/resources/screendat.dart';
import 'package:bucketlist/view/projects_view.dart';
import 'package:bucketlist/view/tripage_view.dart';
import 'package:bucketlist/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../resources/animation.dart';
import '../../resources/colors.dart';
import '../constants.dart';

class TappableCard extends StatefulWidget {
  final String title;
  final String description;

  const TappableCard(this.title, this.description, {Key? key})
      : super(key: key);

  @override
  _TappableCardState createState() => _TappableCardState();
}

class _TappableCardState extends State<TappableCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: GlobalTheme.accent.withAlpha(30),
          onTap: () {
            debugPrint('${widget.title} tapped.');
          },
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(color: GlobalTheme.backWidget),
              height: 50,
              width: ScreenUtil.screenWidth(context) - 20,
              child: Center(
                  child: Column(children: [
                Text(
                  widget.title,
                  style: TextStyle(color: GlobalTheme.foreground),
                ),
                Text(widget.description,
                    style: TextStyle(color: GlobalTheme.foreground))
              ])),
            ),
          ),
        ));
  }
}

class ProjectCards extends StatelessWidget {
  var data;

  ProjectCards({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    if (data != null) {
      for (final mapEntry in data.entries) {
        final key = mapEntry.key;
        final value = mapEntry.value;
        if (key == 'status' && value != null) {
          for (final status in value.entries) {
            final key = status.key;
            final value = status.value;
            list.add(
                Expanded(child: TextCard(value.toString(), key.toString())));
          }
        }

        // Key: a, Value: 1 ...
      }
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: list);
  }
}

class ItemCards extends StatefulWidget {
  int index;
  var tasks;
  String projid;
  ItemCards(
      {Key? key,
      required this.index,
      required this.projid,
      required this.tasks})
      : super(key: key);

  @override
  _ItemCardsState createState() => _ItemCardsState();
}

class _ItemCardsState extends State<ItemCards> {
  bool boolean = false;
  int id = -1;

  @override
  void initState() {
    super.initState();
    print(widget.tasks);
    id = widget.tasks[widget.index]['id'];
    // Initialize localBoolean with the initial value from the API
    boolean = widget.tasks[widget.index]['complete'];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: GlobalTheme.backWidget,
      child: Row(
        children: [
          Checkbox(
            value: boolean,
            onChanged: (value) {
              setState(() {
                boolean = !boolean;
                print(boolean);
                print(widget.projid);
                print(id);
                posttaskboolstate(boolean, widget.projid, id);
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.tasks[widget.index]['name'],
              style: const TextStyle(color: GlobalTheme.foreground),
            ),
          ),
        ],
      ),
    );
  }
}

class TextCard extends StatelessWidget {
  final String number;
  final String label;

  TextCard(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    Icon(Icons.chevron_right);
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 4),
      child: AspectRatio(
        aspectRatio: 1, // to keep the card square-shaped
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorsClass.lightblack,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    number,
                    style:
                        TextStyle(fontSize: 24, color: GlobalTheme.foreground),
                  ),
                  Text(
                    label,
                    style: TextStyle(color: GlobalTheme.foreground),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BigTextCard extends StatelessWidget {
  final String displayed_text;
  bool edit = false;

  BigTextCard(this.displayed_text, this.edit);
  @override
  Widget build(BuildContext context) {
    if (edit) {
      return Card(
        color: GlobalTheme.darkAccent,
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: displayed_text,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: GlobalTheme.foreground,
                  fontSize: MediaQuery.of(context).textScaleFactor *
                      14.0, // Adjust the font size as needed
                ),
              ),
              style: TextStyle(color: GlobalTheme.foreground),
            ),
          ),
        ),
      );
    } else {
      return Card(
        color: GlobalTheme.darkAccent,
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          child: Center(
            child: Text(displayed_text,
                textScaleFactor: 1.15,
                style: const TextStyle(color: GlobalTheme.foreground)),
          ),
        ),
      );
    }
  }
}

class Dropdown extends StatelessWidget {
  final List<String> list;
  final title;

  Dropdown(this.list, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalTheme.backWidget,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: const TextStyle(color: GlobalTheme.foreground)),
            );
          }).toList(),
          onChanged: (_) {},
          hint: Text(title,
              style: const TextStyle(color: GlobalTheme.foreground)),
          dropdownColor: const Color.fromARGB(255, 255, 22, 22),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String name;
  final String org_uid;

  const ImageCard({Key? key, this.name = "default value", this.org_uid = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(0, 50, 50, 50),
        child: GestureDetector(
          onTap: () {
            debugPrint('$name tapped.');
            selected_org = org_uid;
            debugPrint(selected_org);
            Navigator.of(context)
                .push(FadeRoute(page: TriPage(org_uid: org_uid)));
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the radius here for desired curve
                      child: CachedNetworkImage(
                        imageUrl: 'https://picsum.photos/200',
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  // Use the name variable here
                  child: Text(name,
                      style: const TextStyle(color: GlobalTheme.foreground)),
                ),
              ],
            ),
          ),
        ));
  }
}
