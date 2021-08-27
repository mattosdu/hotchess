import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        brightness: Brightness.dark,
        title: Text("Em Desenvolvimento"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed('/inicio'),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Esta pagina está em desenvolvimento'),
        ),
      ),
    );
  }
}
