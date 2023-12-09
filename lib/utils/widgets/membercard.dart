import 'package:bucketlist/utils/widgets/test.dart';
import 'package:flutter/material.dart';
import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screendat.dart';

class MembersCard extends StatefulWidget {
  final List<dynamic>? content;
  int index;
  MembersCard({Key? key, required this.content, required this.index})
      : super(key: key);

  @override
  _MemebersCardState createState() => _MemebersCardState();
}

class _MemebersCardState extends State<MembersCard> {
  @override
  Widget build(BuildContext context) {
    var maincontent = widget.content?[widget.index]
        [widget.content?[widget.index].keys.toList().first];
    var name = maincontent['name'];
    var colour = maincontent['icon_color']; // do stuff
    var roles = maincontent['role'];
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: ColorsClass.darkGrey)),
            color: ColorsClass.lightblack,
          ),
          padding: const EdgeInsets.all(20),
          height: ScreenUtil.screenHeight(context) * 0.13,
          width: ScreenUtil.screenHeight(context) * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 170, 17, 170),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        name[0].toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      name,
                      style: const TextStyle(color: ColorsClass.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(height: 20, width: 45),
                  getRoleWidget(roles)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
