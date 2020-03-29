import 'package:diary_graph_mobile/file_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../localizations.dart';
import '../themestyle.dart';
import '../start_up.dart';

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
        return ListView(
          children: <Widget>[
            ThemeStyleSelector(),
            ShowQuickActionButtonSwitch(),
          ],
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
                child: Text('Material'),
                value: 'material',
              ),
              DropdownMenuItem(
                child: Text('Cupertino'),
                value: 'cupertino',
              ),
            ],
            value: _themeStyleValue,
            onChanged: (selectedValue) {
              setState(() {
                _themeStyleValue = selectedValue;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ShowThemeStyleApplyDialog();
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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowThemeStyleApplyDialog();
              },
            );
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
                      return ShowThemeStyleApplyDialog();
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
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return ShowThemeStyleApplyDialog();
                },
              );
            },
          ),
        );
        break;
      default:
    }
  }
}

// Function ShowThemeStyleApplyDialog = (){};

class ShowThemeStyleApplyDialog extends StatefulWidget {
  @override
  _ShowThemeStyleApplyDialogState createState() =>
      _ShowThemeStyleApplyDialogState();
}

class _ShowThemeStyleApplyDialogState extends State<ShowThemeStyleApplyDialog> {
  @override
  Widget build(BuildContext context) {
    switch (themeStyle) {
      case "material":
        return AlertDialog(
          title:
              Text(Localizations.of(context, AppLocalizations).applyTheTheme),
          content: Text(Localizations.of(context, AppLocalizations)
              .restartTheAppToApplyTheTheme),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                  Localizations.of(context, AppLocalizations).restartLater),
            ),
          ],
        );
        break;
      case "cupertino":
        return CupertinoActionSheet(
          title:
              Text(Localizations.of(context, AppLocalizations).applyTheTheme),
          message: Text(Localizations.of(context, AppLocalizations)
              .restartTheAppToApplyTheTheme),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child:
                Text(Localizations.of(context, AppLocalizations).restartLater),
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
