import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../localizations.dart';
import '../themestyle.dart';

class RecentPage extends StatefulWidget {
  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case 'material':
        return Center(
          child: FloatingActionButton(
            child: Icon(Icons.photo_camera),
            onPressed: () {},
          ),
        );
        break;
      case 'cupertino':
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(Localizations.of(context, AppLocalizations).recent),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(),
            ),
          ),
        );
        break;
      default:
    }
  }
}
