import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'about/aboutpage.dart';
import '../../utils/widgets.dart';
import '../../constants/language.dart';

class AboutSetting extends StatefulWidget {
  const AboutSetting({Key key}) : super(key: key);

  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<AboutSetting> {
  Map<String, dynamic> repository;
  bool _init = true;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (this._init) {
      try {
        http.Response response =
            await http.get('https://api.github.com/repos/tejaswgupta/spoder');
        this.repository = convert.jsonDecode(response.body);
        this.setState(() {});
      } catch (exception) {}
      this._init = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 400),
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0.0,
      openElevation: 0.0,
      closedBuilder: (context, open) => ClosedTile(
        open: open,
        title: language.STRING_ABOUT_TITLE,
        subtitle: language.STRING_ABOUT_SUBTITLE,
      ),
      openBuilder: (context, _) => AboutPage(),
    );
  }
}
