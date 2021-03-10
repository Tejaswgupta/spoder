import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/collection.dart';
import 'settings.dart';
import '../../constants/language.dart';

class IndexingSetting extends StatefulWidget {
  IndexingSetting({Key key}) : super(key: key);
  IndexingState createState() => IndexingState();
}

class IndexingState extends State<IndexingSetting> {
  List<int> linearProgressIndicatorValues;

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: language.STRING_SETTING_INDEXING_TITLE,
      subtitle: language.STRING_SETTING_INDEXING_SUBTITLE,
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56.0,
              alignment: Alignment.topLeft,
              child: this.linearProgressIndicatorValues != null
                  ? TweenAnimationBuilder(
                      tween: Tween<double>(
                          begin: 0,
                          end: this.linearProgressIndicatorValues[0] /
                              this.linearProgressIndicatorValues[1]),
                      duration: Duration(milliseconds: 400),
                      child: Text(
                        (language
                                .STRING_SETTING_INDEXING_LINEAR_PROGRESS_INDICATOR
                                .replaceAll(
                                    'NUMBER_STRING',
                                    this
                                        .linearProgressIndicatorValues[0]
                                        .toString()))
                            .replaceAll(
                                'TOTAL_STRING',
                                this
                                    .linearProgressIndicatorValues[1]
                                    .toString()),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      builder: (_, value, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              child,
                              Container(
                                margin: EdgeInsets.only(top: 6.0),
                                height: 4.0,
                                width: MediaQuery.of(context).size.width - 32.0,
                                child: LinearProgressIndicator(
                                  value: value,
                                ),
                              ),
                            ],
                          ))
                  : Container(
                      child: Chip(
                      backgroundColor: Theme.of(context).accentColor,
                      avatar: Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      label: Text(
                        language.STRING_SETTING_INDEXING_DONE,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
            ),
            Text(
              language.STRING_SETTING_INDEXING_WARNING,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () async {
            await Provider.of<Collection>(context, listen: false).index(
                onProgress: (completed, total, isCompleted) {
              this.setState(() {
                this.linearProgressIndicatorValues = [completed, total];
              });
            });
            this.linearProgressIndicatorValues = null;
          },
          child: Text(
            language.STRING_REFRESH,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
