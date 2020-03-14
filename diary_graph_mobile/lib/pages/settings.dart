import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../localizations.dart';
import '../themestyle.dart';

String _themeStyleValue = themeStyle;
bool _showQuickActionButton = false;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case 'material':
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
            child: Column(
              children: <Widget>[
                ThemeStyleSelector(),
                ShowQuickActionButtonSwitch(),
              ],
            ),
          ),
        );
        break;
      case 'cupertino':
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(Localizations.of(context, AppLocalizations).settings),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                // margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: Column(
                  children: <Widget>[
                    ThemeStyleSelector(),
                    ShowQuickActionButtonSwitch(),
                  ],
                ),
              ),
            ),
          ),
        );
        break;
      default:
    }
  }
}

class ThemeStyleSelector extends StatefulWidget {
  @override
  _ThemeStyleSelectorState createState() => _ThemeStyleSelectorState();
}

class _ThemeStyleSelectorState extends State<ThemeStyleSelector> {
  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case 'material':
        return ListTile(
          title: Text(Localizations.of(context, AppLocalizations).theme),
          trailing: DropdownButton(
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem(
                child: Text('material'),
                value: 'material',
              ),
              DropdownMenuItem(
                child: Text('cupertino'),
                value: 'cupertino',
              ),
            ],
            value: _themeStyleValue,
            onChanged: (selectedValue) {
              setState(() {
                _themeStyleValue = selectedValue;
              });
            },
          ),
          onTap: () {
            switch (_themeStyleValue) {
              case 'material':
                setState(() {
                  _themeStyleValue = 'cupertino';
                });
                break;
              case 'cupertino':
                setState(() {
                  _themeStyleValue = 'material';
                });
                break;
              default:
            }
          },
        );
        break;
      case 'cupertino':
        return Material(
          child: ListTile(
            title: Text(Localizations.of(context, AppLocalizations).theme),
            trailing: DropdownButton(
              icon: Icon(Icons.keyboard_arrow_down),
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text(
                    'Material',
                  ),
                  value: 'material',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Cupertino',
                  ),
                  value: 'cupertino',
                ),
              ],
              value: _themeStyleValue,
              onChanged: (selectedValue) {
                setState(() {
                  _themeStyleValue = selectedValue;
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text(Localizations.of(context, AppLocalizations)
                            .applyTheTheme),
                        message: Text(
                            Localizations.of(context, AppLocalizations)
                                .restartTheAppToApplyTheTheme),
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                              Localizations.of(context, AppLocalizations)
                                  .restartLater),
                        ),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            onPressed: () {},
                            child: Text(
                                Localizations.of(context, AppLocalizations)
                                    .exitAndRestartManually),
                          ),
                        ],
                      );
                    },
                  );
                });
              },
            ),
            onTap: () {
              switch (_themeStyleValue) {
                case 'material':
                  setState(() {
                    _themeStyleValue = 'cupertino';
                  });
                  break;
                case 'cupertino':
                  setState(() {
                    _themeStyleValue = 'material';
                  });
                  break;
                default:
              }
            },
          ),
        );
        break;
      default:
    }
  }
}

class ShowQuickActionButtonSwitch extends StatefulWidget {
  @override
  _ShowQuickActionButtonSwitchState createState() =>
      _ShowQuickActionButtonSwitchState();
}

class _ShowQuickActionButtonSwitchState
    extends State<ShowQuickActionButtonSwitch> {
  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case 'material':
        return ListTile(
          title: Text(Localizations.of(context, AppLocalizations)
              .showQuickActionButton),
          trailing: Switch(
              value: _showQuickActionButton,
              onChanged: (SelectedStatus) {
                _showQuickActionButton = SelectedStatus;
              }),
          onTap: () {
            switch (_showQuickActionButton) {
              case true:
                setState(() {
                  _showQuickActionButton = false;
                });
                break;
              case false:
                setState(() {
                  _showQuickActionButton = true;
                });
                break;
              default:
            }
          },
        );
        break;
      case 'cupertino':
        return Material(
          child: ListTile(
            title: Text(Localizations.of(context, AppLocalizations)
                .showQuickActionButton),
            trailing: CupertinoSwitch(
              value: _showQuickActionButton,
              onChanged: (SelectedStatus) {
                _showQuickActionButton = SelectedStatus;
              },
            ),
            onTap: () {
              switch (_showQuickActionButton) {
                case true:
                  setState(() {
                    _showQuickActionButton = false;
                  });
                  break;
                case false:
                  setState(() {
                    _showQuickActionButton = true;
                  });
                  break;
                default:
              }
            },
          ),
        );
        break;
      default:
    }
  }
}

abstract class Styles {
  static const TextStyle productRowItemName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productRowTotal = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
}
