import 'dart:io';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path;

import 'collection.dart';
import 'visuals.dart';
import '../constants/language.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Configuration configuration;

abstract class ConfigurationKeys {
  Directory collectionDirectory;
  Directory cacheDirectory;
  String homeAddress;
  LanguageRegion languageRegion;
  Accent accent;
  ThemeMode themeMode;
  CollectionSort collectionSortType;
  bool automaticAccent;
  TargetPlatform platform;
  List<dynamic> collectionSearchRecent;
  List<dynamic> discoverSearchRecent;
  List<dynamic> discoverRecent;
}

var address = env['homeAddress'];

Map<String, dynamic> DEFAULT_CONFIGURATION = {
  'collectionDirectory': '/storage/emulated/0/Music',
  'cacheDirectory': '/storage/emulated/0/Music/.spoder',
  'homeAddress': address,
  'languageRegion': 0,
  'accent': 0,
  'themeMode': 0,
  'collectionSortType': 0,
  'automaticAccent': false,
  'platform': 0,
  'collectionSearchRecent': [],
  'discoverSearchRecent': [],
  'discoverRecent': [],
};

class Configuration extends ConfigurationKeys {
  File configurationFile;

  static Future<void> init() async {
    configuration = new Configuration();
    configuration.configurationFile = File(
      path.join(
        (await path.getExternalStorageDirectory()).path,
        'configuration.JSON',
      ),
    );
    if (!await configuration.configurationFile.exists()) {
      await configuration.configurationFile.create(recursive: true);
      await configuration.configurationFile
          .writeAsString(convert.jsonEncode(DEFAULT_CONFIGURATION));
    }
    await configuration.read();
  }

  Future<void> save({
    Directory collectionDirectory,
    Directory cacheDirectory,
    String homeAddress,
    LanguageRegion languageRegion,
    Accent accent,
    ThemeMode themeMode,
    bool showOutOfBoxExperience,
    CollectionSort collectionSortType,
    bool automaticAccent,
    TargetPlatform platform,
    List<dynamic> collectionSearchRecent,
    List<dynamic> discoverSearchRecent,
    List<dynamic> discoverRecent,
  }) async {
    if (collectionDirectory != null) {
      this.cacheDirectory = collectionDirectory;
    }
    if (cacheDirectory != null) {
      this.cacheDirectory = cacheDirectory;
    }
    if (homeAddress != null) {
      this.homeAddress = homeAddress;
    }
    if (languageRegion != null) {
      this.languageRegion = languageRegion;
    }
    if (themeMode != null) {
      this.themeMode = themeMode;
    }
    if (accent != null) {
      this.accent = accent;
    }
    if (collectionSortType != null) {
      this.collectionSortType = collectionSortType;
    }
    if (collectionSearchRecent != null) {
      this.collectionSearchRecent = collectionSearchRecent;
    }
    if (discoverSearchRecent != null) {
      this.discoverSearchRecent = discoverSearchRecent;
    }
    if (collectionSearchRecent != null) {
      this.discoverRecent = discoverRecent;
    }
    if (automaticAccent != null) {
      this.automaticAccent = automaticAccent;
    }
    if (platform != null) {
      this.platform = platform;
    }
    await configuration.configurationFile.writeAsString(convert.jsonEncode({
      'collectionDirectory': this.collectionDirectory.path,
      'cacheDirectory': this.cacheDirectory.path,
      'homeAddress': this.homeAddress,
      'languageRegion': this.languageRegion.index,
      'accent': accents.indexOf(this.accent),
      'themeMode': this.themeMode.index,
      'collectionSortType': this.collectionSortType.index,
      'automaticAccent': this.automaticAccent,
      'platform': this.platform.index,
      'collectionSearchRecent': this.collectionSearchRecent,
      'discoverSearchRecent': this.discoverSearchRecent,
      'discoverRecent': this.discoverRecent,
    }));
  }

  Future<dynamic> read() async {
    Map<String, dynamic> currentConfiguration =
        convert.jsonDecode(await this.configurationFile.readAsString());
    DEFAULT_CONFIGURATION.keys.forEach((String key) {
      if (!currentConfiguration.containsKey(key)) {
        currentConfiguration[key] = DEFAULT_CONFIGURATION[key];
      }
    });
    this.collectionDirectory =
        Directory(currentConfiguration['collectionDirectory']);
    this.cacheDirectory = Directory(currentConfiguration['cacheDirectory']);
    this.homeAddress = currentConfiguration['homeAddress'];
    this.languageRegion =
        LanguageRegion.values[currentConfiguration['languageRegion']];
    this.accent = accents[currentConfiguration['accent']];
    this.themeMode = ThemeMode.values[currentConfiguration['themeMode']];
    this.collectionSortType =
        CollectionSort.values[currentConfiguration['collectionSortType']];
    this.automaticAccent = currentConfiguration['automaticAccent'];
    this.platform = TargetPlatform.values[currentConfiguration['platform']];
    this.collectionSearchRecent =
        currentConfiguration['collectionSearchRecent'];
    this.discoverSearchRecent = currentConfiguration['discoverSearchRecent'];
    this.discoverRecent = currentConfiguration['discoverRecent'];
  }
}
