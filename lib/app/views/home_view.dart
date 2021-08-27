import 'package:chess_hotspot/app/components/appbar_widget.dart';
import 'package:chess_hotspot/app/components/fab_widget.dart';
import 'package:chess_hotspot/app/components/internetcheck_widget.dart';
import 'package:chess_hotspot/app/views/pages/page1.dart';
import 'package:chess_hotspot/app/views/pages/page2.dart';
import 'package:chess_hotspot/app/views/pages/page3.dart';
import 'package:chess_hotspot/app/views/pages/page4.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _hasConnection = 0;

  @override
  void initState() {
    DataConnectivityService()
        .connectivityStreamController
        .stream
        .listen((event) {
      setState(() {
        switch (event) {
          case DataConnectionStatus.connected:
            _hasConnection = 0;
            break;
          case DataConnectionStatus.disconnected:
            _hasConnection = 1;
            break;
        }
      });
    });

    super.initState();
  }

  int pageindex = 0;
  //paginas
  final Page1 _pagina1 = new Page1();
  final Page2 _pagina2 = new Page2();
  final Page3 _pagina3 = new Page3();
  final Page4 _pagina4 = new Page4();
  String _title = 'Procurar HotSpots';
  bool _fab = false;

  Widget _showPage = Page1();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        setState(() {
          _title = 'Procurar HotSpots';
          _fab = false;
        });
        return _pagina1;
        break;
      case 1:
        setState(() {
          _title = 'Criar Hotspot';
          _fab = true;
        });
        return _pagina2;
        break;
      case 2:
        setState(() {
          _title = 'Minhas Conversas';
          _fab = false;
        });
        return _pagina3;
        break;
      case 3:
        setState(() {
          _title = 'Meu Perfil';
          _fab = false;
        });
        return _pagina4;
        break;
      default:
        setState(() {
          _title = 'Procurar HotSpots';
          _fab = false;
        });
        return _pagina1;
        break;
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
        duration: const Duration(milliseconds: 800),
        child: IndexedStack(
          key: ValueKey<int>(_hasConnection + 20),
          index: _hasConnection,
          children: <Widget>[
            new Scaffold(
              extendBody: true,
              appBar: CustomAppbar(title: _title),
              body: Builder(
                builder: (context) {
                  return Container(
                    child: _showPage,
                  );
                },
              ),
              bottomNavigationBar: CurvedNavigationBar(
                key: _bottomNavigationKey,
                index: pageindex,
                height: 52.0,
                items: <Widget>[
                  Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.chat,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
                color: Theme.of(context).backgroundColor,
                buttonBackgroundColor: Theme.of(context).accentColor,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 500),
                onTap: (int tappedIndex) {
                  setState(() {
                    _showPage = _pageChooser(tappedIndex);
                  });
                },
                letIndexChange: (index) => true,
              ),
              floatingActionButton: AnimatedOpacity(
                opacity: _fab ? 1 : 0,
                duration: Duration(milliseconds: 560),
                child: Customfab(
                  icon: Icons.ballot,
                ),
              ),
            ),
            new Carregando(),
          ],
        ),
      ),
    );
  }
}
