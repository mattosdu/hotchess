import 'package:chess_hotspot/app/views/pages/emptypage.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chess_hotspot/app/components/userprefs_widget.dart';
import 'app/components/internetcheck_widget.dart';
import 'app/views/createaccount_view.dart';
import 'app/views/home_view.dart';
import 'app/views/login_view.dart';
import 'app/views/resetsenha_view.dart';
import 'app/views/pages/intro.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Carregando();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ThemeNotifier>(
                  create: (_) => ThemeNotifier()),
            ],
            child: Consumer<ThemeNotifier>(
              builder: (context, ThemeNotifier notifier, child) {
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                    statusBarColor:
                        notifier.darkTheme ? Colors.black87 : Colors.green,
                    statusBarBrightness:
                        notifier.darkTheme ? Brightness.light : Brightness.dark,
                    systemNavigationBarColor:
                        notifier.darkTheme ? Colors.black87 : Colors.green,
                    systemNavigationBarIconBrightness:
                        notifier.darkTheme ? Brightness.light : Brightness.dark,
                  ),
                );
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode:
                      notifier.darkTheme ? ThemeMode.dark : ThemeMode.light,
                  initialRoute: notifier.intropass ? '/inicio' : '/inicio',
                  routes: {
                    '/inicio': (context) => HomeScreen(),
                    '/login': (context) => LoginPage(),
                    '/resetsenha': (context) => ResetsenhaPage(),
                    '/criarconta': (context) => CreateAccountPage(),
                    '/intro': (context) => Intropage(),
                    '/vazio': (context) => EmptyPage(),
                  },
                );
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Carregando();
      },
    );
  }
}
