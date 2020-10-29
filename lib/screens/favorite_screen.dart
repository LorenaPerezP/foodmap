import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_ui_kit/util/foods.dart';
import 'package:restaurant_ui_kit/widgets/grid_product.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with AutomaticKeepAliveClientMixin<FavoriteScreen> , AfterLayoutMixin{

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
    super.build(context);
    return Center(child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      "Mis Favoritos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.25),
                      ),
                      itemCount: foods == null ? 0 :foods.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map food = foods[index];
                        return GridProduct(
                          img: food['img'],
                          isFav: true,
                          name: food['name'],
                          rating: 5.0,
                          raters: 23,
                        );
                      },
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      "Mis Favoritos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height * 2),
                      ),
                      itemCount: foods == null ? 0 :foods.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map food = foods[index];
                        return GridProduct(
                          img: food['img'],
                          isFav: true,
                          name: food['name'],
                          rating: 5.0,
                          raters: 23,
                        );
                      },
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            );
          }
        } )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
