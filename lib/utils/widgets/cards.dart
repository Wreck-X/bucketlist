import 'package:flutter/material.dart';

class TappableCard extends StatefulWidget {
  final String title;

  const TappableCard(this.title, {Key? key}) : super(key: key);

  @override
  _TappableCardState createState() => _TappableCardState();
}

class _TappableCardState extends State<TappableCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('${widget.title} tapped.');
        },
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(widget.title)),
        ),
      ),
    );
  }
}
