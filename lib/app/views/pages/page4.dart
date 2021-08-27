import 'package:flutter/material.dart';
import 'package:chess_hotspot/app/components/userprefs_widget.dart';
import 'package:provider/provider.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => Center(
        child: Switch(
          onChanged: (value) {
            notifier.toggleTheme();
          },
          value: notifier.darkTheme,
        ),
      ),
    );
  }
}
