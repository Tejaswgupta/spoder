import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/visuals.dart';
import '../core/configuration.dart';
import 'home.dart';

class Spoder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Visuals>(
      create: (context) => Visuals(
        accent: configuration.accent,
        themeMode: configuration.themeMode,
        platform: configuration.platform,
      ),
      builder: (context, _) => Consumer<Visuals>(
        builder: (context, visuals, _) => MaterialApp(
          theme: visuals.theme,
          darkTheme: visuals.darkTheme,
          themeMode: visuals.themeMode,
          home: Home(),
        ),
      ),
    );
  }
}
