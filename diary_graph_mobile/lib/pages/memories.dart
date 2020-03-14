import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../localizations.dart';
import '../themestyle.dart';

class MemoriesPage extends StatefulWidget {
  @override
  _MemoriesPageState createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case 'material':
        return Center(
          child: Text(
            Localizations.of(context, AppLocalizations).memories,
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
            middle: Text(Localizations.of(context, AppLocalizations).memories),
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
