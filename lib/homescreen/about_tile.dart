import 'package:flutter/material.dart';
import 'package:sabel_object_detection/util/uidata.dart';
import 'package:sabel_object_detection/util/Hyperlink.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon: Image.asset(UIData.logoImage),
      icon: Image.asset(UIData.logoImage),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Developed by,",
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "Sabarish K",
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "sabel.ai",
        ),
        SizedBox(
          height: 5.0,
        ),
        Hyperlink('https://sabarishk.com/', 'https://sabarishk.com')
      ],
      applicationName: UIData.appName,
      applicationVersion: "1.0.0",
      applicationLegalese: "Apache License 2.0",
    );
  }
}
