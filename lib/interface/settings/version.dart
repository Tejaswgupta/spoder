import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import 'settings.dart';
import '../../constants/language.dart';

class VersionSetting extends StatefulWidget {
  VersionSetting({Key key}) : super(key: key);
  VersionState createState() => VersionState();
}

class VersionState extends State<VersionSetting> {
  String version = 'v' + VERSION;
  String updateUri;

  @override
  void initState() {
    super.initState();
    http
        .get('https://api.github.com/repos/tejaswgupta/spoder/releases')
        .then((http.Response response) {
      this.setState(() {
        List<dynamic> json = convert.jsonDecode(response.body);
        this.version = json.first['tag_name'];
        this.updateUri = json.first['assets'][0]['browser_download_url'];
      });
    }).catchError((exception) {});
  }

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: language.STRING_SETTING_APP_VERSION_TITLE,
      subtitle: language.STRING_SETTING_APP_VERSION_SUBTITLE,
      child: Column(
        children: [
          Table(
            children: [
              TableRow(
                children: [
                  Text(language.STRING_SETTING_APP_VERSION_INSTALLED),
                  Text('v' + VERSION),
                ],
              ),
              TableRow(children: [
                Text(language.STRING_SETTING_APP_VERSION_LATEST),
                Text(this.version ?? language.STRING_NO_INTERNET_TITLE),
              ]),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.all(16.0),
      actions: this.version == 'v' + VERSION
          ? null
          : [
              MaterialButton(
                onPressed: () => launch(this.updateUri),
                child: Text(
                  language.STRING_DOWNLOAD_UPDATE,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
    );
  }
}
