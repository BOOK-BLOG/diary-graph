import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../localizations.dart';
import '../themestyle.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case 'material':
        return Center(
          child: Text(
            Localizations.of(context, AppLocalizations).search,
            style: TextStyle(
              color: Color.fromRGBO(96, 96, 96, 1),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        break;
      case 'cupertino':
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(Localizations.of(context, AppLocalizations).search),
          ),
          child: SafeArea(
            child: Container(),
          ),
        );
        break;
      default:
    }
  }
}
