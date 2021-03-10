import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/visuals.dart';
import 'settings.dart';
import '../../constants/language.dart';

class MiscellaneousSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: language.STRING_SETTING_MISCELLANEOUS_TITLE,
      subtitle: language.STRING_SETTING_MISCELLANEOUS_SUBTITLE,
      child: Column(children: [
        Consumer<Visuals>(
          builder: (context, visuals, _) => SwitchListTile(
            title: Text(language.STRING_SETTING_MISCELLANEOUS_ENABLE_IOS_TITLE),
            subtitle:
                Text(language.STRING_SETTING_MISCELLANEOUS_ENABLE_IOS_SUBTITLE),
            value: visuals.platform == TargetPlatform.iOS,
            onChanged: (bool isiOS) => visuals.update(
              platform: isiOS ? TargetPlatform.iOS : TargetPlatform.android,
            ),
          ),
        ),
      ]),
      margin: EdgeInsets.only(bottom: 8.0),
    );
  }
}
