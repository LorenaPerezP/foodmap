import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/screens/login.dart';
import 'package:restaurant_ui_kit/screens/register.dart';
import 'package:flutter/services.dart';

class JoinApp extends StatefulWidget {
  @override
  _JoinAppState createState() => _JoinAppState();
}

class _JoinAppState extends State<JoinApp>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 2);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext _) {
    return Center(
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).accentColor,
                labelColor: Theme.of(context).accentColor,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w800,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w800,
                ),
                tabs: <Widget>[
                  Tab(
                    text: "Iniciar Sesión",
                  ),
                  Tab(
                    text: "Registro",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                LoginScreen(),
                RegisterScreen(),
              ],
            ),
          );
        } else {
          return Container(
              color: Colors.white,
              child: Row(
            children: <Widget>[
              Expanded (
                  child: RegisterScreen() ),
                Expanded (child:LoginScreen())],
          ));
        }
      }),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp , DeviceOrientation.portraitDown , DeviceOrientation.landscapeLeft , DeviceOrientation.landscapeRight]);
  }
}
