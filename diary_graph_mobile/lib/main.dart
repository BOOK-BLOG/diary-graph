import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localizations.dart';
import 'themestyle.dart';
import 'file_system.dart';
import 'start_up.dart';
import 'pages/recent.dart';
import 'pages/memories.dart';
import 'pages/search.dart';
import 'pages/settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getPath();
  // startUp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case 'material':
        return MaterialApp(
          locale: Locale('en', 'US'),
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          title: 'Diary Graph',
          home: Home(),
          supportedLocales: <Locale>[
            Locale('en', 'US'),
            Locale('zh', 'CN'),
          ],
        );
        break;
      case 'cupertino':
        return CupertinoApp(
          locale: Locale('en', 'US'),
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(),
          title: 'Diary Graph',
          home: Home(),
          supportedLocales: <Locale>[
            Locale('en', 'US'),
            Locale('zh', 'CN'),
          ],
        );
        break;
      default:
    }
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages = <Widget>[
    RecentPage(),
    MemoriesPage(),
    SearchPage(),
    SettingsPage(),
  ];

  int _currentIndex = 0;

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _materialAppBar() {
    switch (_currentIndex) {
      case 0:
        return AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0.0,
          title: Text(
            Localizations.of(context, AppLocalizations).recent,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        );
        break;
      case 1:
        return AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0.0,
          title: Text(
            Localizations.of(context, AppLocalizations).memories,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        );
        break;
      case 2:
        return AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0.0,
          title: Text(
            Localizations.of(context, AppLocalizations).search,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        );
        break;
      case 3:
        return AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0.0,
          title: Text(
            Localizations.of(context, AppLocalizations).settings,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case 'material':
        return Scaffold(
          appBar: _materialAppBar(),
          body: Center(
            child: _pages.elementAt(_currentIndex),
          ),
          floatingActionButton: Visibility(
            visible: true,
            child: FloatingActionButton(
              child: Icon(Icons.add_a_photo),
              onPressed: () {
                // startUp();
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTapHandler,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue[700],
            elevation: 0.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                title: Text(Localizations.of(context, AppLocalizations).recent),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title:
                    Text(Localizations.of(context, AppLocalizations).memories),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(Localizations.of(context, AppLocalizations).search),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title:
                    Text(Localizations.of(context, AppLocalizations).settings),
              ),
            ],
          ),
        );
        break;
      case 'cupertino':
        return CupertinoAppBottomNavigationBar();
        break;
      default:
    }
  }
}

class CupertinoAppBottomNavigationBar extends StatefulWidget {
  @override
  _CupertinoAppBottomNavigationBarState createState() =>
      _CupertinoAppBottomNavigationBarState();
}

class _CupertinoAppBottomNavigationBarState
    extends State<CupertinoAppBottomNavigationBar> {
  Widget appCupertinoGetPages(int index) {
    switch (index) {
      case 0:
        return RecentPage();
        break;
      case 1:
        return MemoriesPage();
        break;
      case 2:
        return SearchPage();
        break;
      case 3:
        return SettingsPage();
        break;
      default:
        return RecentPage();
    }
  }

  Map<String, WidgetBuilder> _routes = {};

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text(Localizations.of(context, AppLocalizations).recent),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text(Localizations.of(context, AppLocalizations).memories),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(Localizations.of(context, AppLocalizations).search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(Localizations.of(context, AppLocalizations).settings),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            return this.appCupertinoGetPages(index);
          },
          routes: _routes,
        );
      },
    );
  }
}
