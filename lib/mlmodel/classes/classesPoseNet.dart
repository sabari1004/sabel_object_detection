import 'package:flutter/material.dart';
import 'package:sabel_object_detection/util/CommonScaffold.dart';

class ClassesPoseNet extends StatelessWidget {
  Size deviceSize;

  //Title
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return CommonScaffold(
      appTitle: "PoseNet - Key Points",
      bodyData: bodyData(),
      elevation: 0.0,
    );
  }

  //body
  Widget bodyData() => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            profileHeader(),
            descColumn(),
          ],
        ),
      );

  //Column1
  Widget profileHeader() => Container(
        height: deviceSize.height / 16,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.black,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "List of joints which can be detected by PoseNet",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.yellowAccent,
                        fontSize: 3.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  //Column2
  Widget descColumn() => Container(
            child: Text(
              //"Id     Part\n"
                  "0.     nose\n"
                  "1.     leftEye\n"
                  "2.     rightEye\n"
                  "3.     leftEar\n"
                  "4.     rightEar\n"
                  "5.     leftShoulder\n"
                  "6.     rightShoulder\n"
                  "7.     leftElbow\n"
                  "8.     rightElbow\n"
                  "9.     leftWrist\n"
                  "10.     rightWrist\n"
                  "11.     leftHip\n"
                  "12.     rightHip\n"
                  "13.     leftKnee\n"
                  "14.     rightKnee\n"
                  "15.     leftAnkle\n"
                  "16.     rightAnkle\n",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
              textAlign: TextAlign.start,
              maxLines: 1001,
            ),
      );
}
