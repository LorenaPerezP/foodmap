import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/screens/cart.dart';
import 'package:restaurant_ui_kit/screens/favorite_screen.dart';
import 'package:restaurant_ui_kit/screens/home.dart';
import 'package:restaurant_ui_kit/screens/notifications.dart';
import 'package:restaurant_ui_kit/screens/profile.dart';
import 'package:restaurant_ui_kit/screens/search.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:restaurant_ui_kit/widgets/badge.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Center(child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                Constants.appName,
              ),
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: IconBadge(
                    icon: Icons.notifications,
                    size: 22.0,
                  ),
                  color: _page == 0
                      ? Theme.of(context).accentColor
                      : Theme.of(context).textTheme.caption.color,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Notifications();
                        },
                      ),
                    );
                  },
                  tooltip: "Notificación",
                ),
              ],
            ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: <Widget>[
                Home(),
                FavoriteScreen(),
                SearchScreen(),
                CartScreen(),
                Profile(),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 7),
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 24.0,
                    ),
                    color: _page == 0
                        ? Theme.of(context).accentColor
                        : Theme.of(context).textTheme.caption.color,
                    onPressed: () => _pageController.jumpToPage(0),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 24.0,
                    ),
                    color: _page == 1
                        ? Theme.of(context).accentColor
                        : Theme.of(context).textTheme.caption.color,
                    onPressed: () => _pageController.jumpToPage(1),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.map,
                      size: 24.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    color: _page == 2
                        ? Theme.of(context).accentColor
                        : Theme.of(context).textTheme.caption.color,
                    onPressed: () => _pageController.jumpToPage(2),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.recent_actors,
                      size: 24.0,
                    ),
                    color: _page == 3
                        ? Theme.of(context).accentColor
                        : Theme.of(context).textTheme.caption.color,
                    onPressed: () => _pageController.jumpToPage(3),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 24.0,
                    ),
                    color: _page == 4
                        ? Theme.of(context).accentColor
                        : Theme.of(context).textTheme.caption.color,
                    onPressed: () => _pageController.jumpToPage(4),
                  ),
                  SizedBox(width: 7),
                ],
              ),
              color: Theme.of(context).primaryColor,
              shape: CircularNotchedRectangle(),
            ),
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              elevation: 4.0,
              child: Icon(
                Icons.map,
              ),
              onPressed: () => _pageController.jumpToPage(2),
            ),
          ),
        );
      } else {
        return Center(
          child: Scaffold(
            appBar: AppBar(
              title: Text("FoodMap"),
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  new ListTile(
                    title: Text("Home"),
                    onTap: () => _pageController.jumpToPage(0),
                  ),
                  new ListTile(
                    title: Text("Favorite"),
                      onTap: () => _pageController.jumpToPage(1)
                  ),
                  new ListTile(
                    title: Text("Search"),
                      onTap: () => _pageController.jumpToPage(2)
                  ),
                  new ListTile(
                    title: Text("Cart"),
                      onTap: () => _pageController.jumpToPage(3)
                  ),
                  new ListTile(
                    title: Text("Profile"),
                      onTap: () => _pageController.jumpToPage(5)
                  )
                ],
              ),
            ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: <Widget>[
                Home(),
                FavoriteScreen(),
                SearchScreen(),
                CartScreen(),
                Profile(),
              ],
            ),
          ),
        );
      }
    }));
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
