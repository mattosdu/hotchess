import 'package:flutter/material.dart';

class Customfab extends StatefulWidget {
  final IconData icon;

  const Customfab({Key key, this.icon}) : super(key: key);

  @override
  _CustomfabState createState() => _CustomfabState();
}

class _CustomfabState extends State<Customfab> {
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        this.widget.icon,
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
