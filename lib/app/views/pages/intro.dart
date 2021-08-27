import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:chess_hotspot/app/components/userprefs_widget.dart';
import 'package:provider/provider.dart';

class Intropage extends StatefulWidget {
  @override
  _IntropageState createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 19.0,
      color: Colors.black,
    );
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Consumer<IntroNotifier>(
      builder: (context, notifier, child) => Center(
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Pesquisar Hotspots",
              body:
                  "Encontre Pessoas jogando proximo a você e descida se ira comparecer pra um jogo, tem até campeonatos!",
              image: _buildImage('img1'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Crie um Hotspot",
              body:
                  "Defina local, horario de inicio e fim, se tem ou nao peças e tabuleiro e encontre pessoas pra jogar ao vivo",
              image: _buildImage('img2'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Faça Amizade On e Offline",
              body:
                  "Com o chat incluso no aplicativo você pode ter organizar os detalhes antes de criar um evento",
              image: _buildImage('img3'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Tudo isso e muito mais",
              body:
                  "Para o aplicativo funcionar precisamos de acesso ao seu local",
              image: _buildImage('img4'),
              footer: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Conceder acesso',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                ),
              ),
              decoration: pageDecoration,
            ),
          ],
          onDone: () {
            notifier.toggleIntro();
          },

          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Pular'),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeColor: Color(0xFF31AA50),
            activeSize: Size(24.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
