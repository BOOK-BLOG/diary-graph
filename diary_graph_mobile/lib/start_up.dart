import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'file_system.dart';

startUp() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  var startUpJsonFile = File(appDocDir.path + "/data/start_up.json");
  if (await startUpJsonFile.exists()) {
    var startUpJsonStr = await startUpJsonFile.readAsString();
    debugPrint(startUpJsonStr);
  }else{
    // Navigator.push(context, route)
  }
}
