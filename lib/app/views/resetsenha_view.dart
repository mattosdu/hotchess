import 'package:flutter/material.dart';

class ResetsenhaPage extends StatefulWidget {
  ResetsenhaPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResetsenhaPageState createState() => _ResetsenhaPageState();
}

class _ResetsenhaPageState extends State<ResetsenhaPage> {
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
      ),
    );

    final resetSenhaButon = Material(
      elevation: 5.0,
      color: Colors.green,
      child: MaterialButton(
        height: 50.0,
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          // This moves from the personal info page to the credentials page,
          // replacing this page with that one.
          Navigator.of(context).pushReplacementNamed('/login');
        },
        child: Text(
          "Esqueci minha Senha",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 35.0),
                resetSenhaButon,
                SizedBox(height: 35.0),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
