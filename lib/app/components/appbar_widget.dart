import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56);

  final String title;

  const CustomAppbar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backwardsCompatibility: false,
      backgroundColor: Theme.of(context).backgroundColor,
      brightness: Theme.of(context).brightness,
      elevation: 6,
      title: Text(this.title, style: TextStyle(color: Colors.white)),
      actions: <Widget>[
        PopupMenuButton(
          onSelected: (value) {
            if (value == 0) {
              Navigator.of(context).pushReplacementNamed('/vazio');
            }
            if (value == 1) {
              Navigator.of(context).pushReplacementNamed('/vazio');
            }
            if (value == 2) {
              Navigator.of(context).pushReplacementNamed('/vazio');
            }
          },
          icon: Icon(Icons.view_list, color: Colors.white),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: Text("Sobre o Aplicativo"),
            ),
            PopupMenuItem(
              value: 1,
              child: Text("Termos de Privacidade"),
            ),
            PopupMenuItem(
              value: 2,
              child: Text("Licensas"),
            ),
          ],
        ),
      ],
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
