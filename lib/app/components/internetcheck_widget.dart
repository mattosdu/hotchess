import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

class DataConnectivityService {
  StreamController<DataConnectionStatus> connectivityStreamController =
      StreamController<DataConnectionStatus>();
  DataConnectivityService() {
    DataConnectionChecker().onStatusChange.listen((dataConnectionStatus) {
      connectivityStreamController.add(dataConnectionStatus);
    });
  }
}

class Carregando extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 6,
                backgroundColor: Color(0x45A7A7A7),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Text(
                "Aguardando Rede",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 35),
            Container(
              child: Text(
                "Esse aplicativo precisa de internet para funcionar",
                textDirection: TextDirection.ltr,
              ),
            ),
            SizedBox(height: 160),
          ],
        ),
      ),
    );
  }
}
