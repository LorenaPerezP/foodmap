import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_ui_kit/screens/checkout.dart';
import 'package:restaurant_ui_kit/util/foods.dart';
import 'package:restaurant_ui_kit/widgets/cart_item.dart';
import 'package:restaurant_ui_kit/widgets/grid_product.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin<CartScreen>, AfterLayoutMixin {
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
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ListView.builder(
              itemCount: foods == null ? 0 : foods.length,
              itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                Map food = foods[index];
//                print(foods);
//                print(foods.length);
                return CartItem(
                  img: food['img'],
                  isFav: false,
                  name: food['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
          ),
        );
      } else {
        return  Scaffold(
          body: Row(
            children: [
              Expanded(child: ListView.builder(
                itemCount: foods == null ? 0 : foods.length,
                itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                  Map food = foods[index];
//                print(foods);
//                print(foods.length);
                  return CartItem(
                    img: food['img'],
                    isFav: false,
                    name: food['name'],
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ),),
              Expanded(child: ListView.builder(
                  itemCount: foods == null ? 0 : foods.length,
                  itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                    Map food = foods[index];
//                print(foods);
//                print(foods.length);
                    return CartItem(
                      img: food['img'],
                      isFav: false,
                      name: food['name'],
                      rating: 5.0,
                      raters: 23,
                    );
                  },
                )
              )
            ],
          ),
        );
      }
    }));
  }

  @override
  bool get wantKeepAlive => true;
}
