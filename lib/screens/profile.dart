import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_ui_kit/providers/app_provider.dart';
import 'package:restaurant_ui_kit/screens/splash.dart';
import 'package:restaurant_ui_kit/util/const.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AfterLayoutMixin {

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),

              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Image.asset(
                          "assets/cm2.png",
                          fit: BoxFit.cover,
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Andres Rodriguez",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 5.0),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "AndresR@gmail.com",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context){
                                          return SplashScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text("Cerrar Sesión",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        flex: 3,
                      ),
                    ],
                  ),

                  Divider(),
                  Container(height: 15.0),

                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Acerca de ti".toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ListTile(
                    title: Text(
                      "Nombre Completo",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    subtitle: Text(
                      "Andres David Rodriguez Martinez",
                    ),

                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20.0,
                      ),
                      onPressed: (){
                      },
                      tooltip: "Editar",
                      color: Theme.of(context).accentColor,
                    ),
                  ),

                  ListTile(
                    title: Text(
                      "Correo",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    subtitle: Text(
                      "AndresR@gmail.com",
                    ),
                  ),

                  ListTile(
                    title: Text(
                      "Telefono",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    subtitle: Text(
                      "(+57) 321-654-9875",
                    ),
                  ),

                  ListTile(
                    title: Text(
                      "Fecha de Cumpleaños",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    subtitle: Text(
                      "Enero 9, 1995",
                    ),
                  ),

                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? SizedBox()
                      : ListTile(
                    title: Text(
                      "Modo Oscuro",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    trailing: Switch(
                      value: Provider.of<AppProvider>(context).theme == Constants.lightTheme
                          ? false
                          : true,
                      onChanged: (v) async{
                        if (v) {
                          Provider.of<AppProvider>(context, listen: false)
                              .setTheme(Constants.darkTheme, "dark");
                        } else {
                          Provider.of<AppProvider>(context, listen: false)
                              .setTheme(Constants.lightTheme, "light");
                        }
                      },
                      activeColor: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return  Scaffold(
              body: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: Row(
                  children: [
                    Expanded(child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Image.asset(
                            "assets/cm2.png",
                            fit: BoxFit.cover,
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Andres Rodriguez",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 5.0),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "AndresR@gmail.com",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context){
                                            return SplashScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text("Cerrar Sesión",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                    ),
                    Expanded(child:
                      Row(
                        children: [
                          Flexible(
                            child: ListView(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Nombre Completo",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                subtitle: Text(
                                  "Andres David Rodriguez Martinez",
                                ),

                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    size: 20.0,
                                  ),
                                  onPressed: (){
                                  },
                                  tooltip: "Editar",
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                                    ListTile(
                                      title: Text(
                                        "Correo",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      subtitle: Text(
                                        "AndresR@gmail.com",
                                      ),
                                    ),
                              ListTile(
                                title: Text(
                                  "Fecha de Cumpleaños",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                subtitle: Text(
                                  "Enero 9, 1995",
                                ),
                              ),
                              MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ? SizedBox()
                                  : ListTile(
                                title: Text(
                                  "Modo Oscuro",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                trailing: Switch(
                                  value: Provider.of<AppProvider>(context).theme == Constants.lightTheme
                                      ? false
                                      : true,
                                  onChanged: (v) async{
                                    if (v) {
                                      Provider.of<AppProvider>(context, listen: false)
                                          .setTheme(Constants.darkTheme, "dark");
                                    } else {
                                      Provider.of<AppProvider>(context, listen: false)
                                          .setTheme(Constants.lightTheme, "light");
                                    }
                                  },
                                  activeColor: Theme.of(context).accentColor,
                                ),
                              )
                                  ]
                                ),
                            )])
                      )
                  ],
                ),
              ),
            );
        }
        })
    );
  }
}
