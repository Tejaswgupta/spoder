import 'dart:async';
import 'package:flutter/material.dart';
import '../core/discover.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';
import 'package:flutter/services.dart';

import '../core/collection.dart';
import '../core/fileintent.dart';
import 'collection/collectionmusic.dart';
import 'collection/collectionsearch.dart';
import 'nowplaying.dart';
import 'settings/settings.dart';
import '../constants/language.dart';

enum Screen { nowPlaying, collection, settings, discover }

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  int index = fileIntent.startScreen.index;
  List<GlobalKey<NavigatorState>> navigatorKeys = <GlobalKey<NavigatorState>>[
    new GlobalKey<NavigatorState>(),
    new GlobalKey<NavigatorState>(),
    new GlobalKey<NavigatorState>(),
    new GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
    if (fileIntent.startScreen == Screen.nowPlaying) fileIntent.play();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<bool> didPopRoute() async {
    if (this.navigatorKeys[this.index].currentState.canPop()) {
      this.navigatorKeys[this.index].currentState.pop();
    } else {
      showDialog(
        context: context,
        builder: (subContext) => AlertDialog(
          title: Text(
            language.STRING_EXIT_TITLE,
            style: Theme.of(subContext).textTheme.headline1,
          ),
          content: Text(
            language.STRING_EXIT_SUBTITLE,
            style: Theme.of(subContext).textTheme.headline5,
          ),
          actions: [
            MaterialButton(
              textColor: Theme.of(context).primaryColor,
              onPressed: SystemNavigator.pop,
              child: Text(language.STRING_YES),
            ),
            MaterialButton(
              textColor: Theme.of(context).primaryColor,
              onPressed: Navigator.of(subContext).pop,
              child: Text(language.STRING_NO),
            ),
          ],
        ),
      );
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = <Widget>[
      Navigator(
        key: this.navigatorKeys[0],
        initialRoute: 'nowPlaying',
        onGenerateRoute: (RouteSettings routeSettings) {
          Route route;
          if (routeSettings.name == 'nowPlaying') {
            route = MaterialPageRoute(
              builder: (BuildContext context) => NowPlaying(),
            );
          }
          return route;
        },
      ),
      Navigator(
        key: this.navigatorKeys[1],
        initialRoute: 'collectionMusic',
        onGenerateRoute: (RouteSettings routeSettings) {
          Route<dynamic> route;
          if (routeSettings.name == 'collectionMusic') {
            route = new MaterialPageRoute(
                builder: (BuildContext context) => CollectionMusic());
          }
          if (routeSettings.name == 'collectionSearch') {
            route = new PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 400),
              reverseTransitionDuration: Duration(milliseconds: 400),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  Consumer<Collection>(
                builder: (context, collection, _) => CollectionSearch(),
              ),
            );
          }
          return route;
        },
      ),
      Navigator(
        key: this.navigatorKeys[2],
        initialRoute: 'settings',
        onGenerateRoute: (RouteSettings routeSettings) {
          Route route;
          if (routeSettings.name == 'settings') {
            route = MaterialPageRoute(
              builder: (BuildContext context) => Settings(),
            );
          }
          return route;
        },
      ),
      Navigator(
        key: this.navigatorKeys[3],
        initialRoute: 'discover',
        onGenerateRoute: (RouteSettings routeSettings) {
          Route route;
          if (routeSettings.name == 'discover') {
            route = MaterialPageRoute(
              builder: (BuildContext context) => Settings(),
            );
          }
          return route;
        },
      ),
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Collection>(
            create: (context) => Collection.get()),
        ChangeNotifierProvider<Language>(create: (context) => Language.get()),
      ],
      builder: (context, _) => Consumer<Language>(
        builder: (context, _, __) => Scaffold(
          body: PageTransitionSwitcher(
            child: screens[this.index],
            duration: Duration(milliseconds: 400),
            transitionBuilder: (child, animation, secondaryAnimation) =>
                FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: this.index,
            onTap: (int index) => this.setState(() => this.index = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow),
                label: language.STRING_NOW_PLAYING,
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: language.STRING_COLLECTION,
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: language.STRING_SETTING,
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
