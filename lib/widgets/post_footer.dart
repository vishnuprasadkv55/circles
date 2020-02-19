import 'package:circles/widgets/card_types/card_expanded.dart';
import 'package:flutter/material.dart';

class PostFooter extends StatefulWidget {
  const PostFooter({
    Key key,
  }) : super(key: key);

  @override
  _PostFooterState createState() => _PostFooterState();
}

class _PostFooterState extends State<PostFooter> {
  var favColor = Colors.grey;
  @override
  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.favorite,
              color: favColor,
            ),
            onPressed: () {
              this.setState(() {
                this.favColor =
                    this.favColor == Colors.pink ? Colors.grey : Colors.pink;
              });
            }),
        IconButton(
            icon: Icon(
              Icons.comment,
              color: Colors.black,
            ),
            onPressed: () {
                                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return CardExpanded();
                    }),
                  );
            }),
        IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.green,
            ),
            onPressed: () {})
      ],
    );
  }
}
