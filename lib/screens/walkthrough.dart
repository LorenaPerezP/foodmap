import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restaurant_ui_kit/screens/join.dart';


class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {

  List pageInfos = [
    {
      "title": "Comida Fresca",
      "body": "¡Una experiencia única!                                               "
          "Podras degustar de un puesto con la comida que mas te agrade, "
          "no te quedes con las ganas de conocer nuevos lugares. "
          "FoodMap te brinda esa oportunidad.",
      "img": "assets/on1.png",
    },
    {
      "title": "¡En un instante!",
      "body": "¿Por qué no calmar tu antojito al instante?              "
          "FoodMap te permite visualizar los lugares mas cercanos "
          "a ti para que calmes ese antojito.",
      "img": "assets/on2.png",
    },
    {
      "title": "¿No sabes que comer?",
      "body": "¡FoodMap te ayuda a pensar!                                     "
          " Con FoodMap encontrarás variedades de comida, asi podras degustar "
          "algo diferente cada vez.",
      "img": "assets/on3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      for(int i = 0; i<pageInfos.length; i++)
        _buildPageModel(pageInfos[i])
    ];

    return WillPopScope(
      onWillPop: ()=>Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: IntroductionScreen(
            pages: pages,
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return JoinApp();
                  },
                ),
              );
            },
            onSkip: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return JoinApp();
                  },
                ),
              );
            },
            showSkipButton: true,
            skip: Text("Cerrar"),
            next: Text(
              "Siguiente",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).accentColor,
              ),
            ),
            done: Text(
              "Iniciemos!",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPageModel(Map item){
    return PageViewModel(
      title: item['title'],
      body: item['body'],
      image: Image.asset(
        item['img'],
        height: 185.0,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).accentColor,
        ),
        bodyTextStyle: TextStyle(fontSize: 15.0),
//        dotsDecorator: DotsDecorator(
//          activeColor: Theme.of(context).accentColor,
//          activeSize: Size.fromRadius(8),
//        ),
        pageColor: Theme.of(context).primaryColor,
      ),
    );
  }
}