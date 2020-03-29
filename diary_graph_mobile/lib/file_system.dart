import 'dart:io';
import 'package:path_provider/path_provider.dart';

var tempDir;
var appDocDir;

getPath() async {
  tempDir = await getTemporaryDirectory();
  appDocDir = await getApplicationDocumentsDirectory();
}

getFile(path) async {
  return new File('$path');
}
