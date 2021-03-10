import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'constants/language.dart';
import 'core/collection.dart';
import 'core/configuration.dart';
import 'core/discover.dart';
import 'core/download.dart';
import 'core/fileintent.dart';
import 'interface/exception.dart';
import 'interface/spoder.dart';
import 'utils/methods.dart';

const String TITLE = 'Spoder';
const String VERSION = '0.0.4';
const String AUTHOR = 'Tejasw';
const String LICENSE = 'GPL-3.0';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  try {
    await DotEnv.load(fileName: ".env");
    await Methods.askStoragePermission();
    await Configuration.init();
    await Collection.init(
      collectionDirectory: configuration.collectionDirectory,
      cacheDirectory: configuration.cacheDirectory,
    );
    await Discover.init(
      homeAddress: configuration.homeAddress,
    );
    await Language.init(
      languageRegion: configuration.languageRegion,
    );
    await FileIntent.init();
    await Download.init();
    runApp(
      new Spoder(),
    );
  } catch (exception) {
    runApp(
      new ExceptionMaterialApp(
        exception: exception,
      ),
    );
  }
}
