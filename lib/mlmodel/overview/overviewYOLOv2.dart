import 'package:flutter/material.dart';
import 'package:sabel_object_detection/util/CommonScaffold.dart';
import 'package:sabel_object_detection/util/ProfileTile.dart';
import 'package:sabel_object_detection/util/Hyperlink.dart';
import 'package:sabel_object_detection/util/uidata.dart';

class OverviewYOLOv2 extends StatelessWidget {
  Size deviceSize;

  //Title
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return CommonScaffold(
      appTitle: "Overview - YOLOv2 Model",
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
        archCard(),
        accountColumn(),
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
                "YOLO - Real Time Object Detection",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.yellowAccent, fontSize: 3.0 ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  //Column2
  Widget descColumn() => Container(
    height: deviceSize.height / 6,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Text(
          "           You only look once (YOLO) is a state-of-the-art, real-time object detection system. YOLOv2 uses a few tricks to improve training and increase performance. Like Overfeat and SSD we use a fully-convolutional model, but YOLO still train on whole images, not hard negatives. Like Faster R-CNN, this model adjust priors on bounding boxes instead of predicting the width and height outright. However, this model still predict the x and y coordinates directly.",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, debugLabel: 'whiteMountainView body2'),
          textAlign: TextAlign.justify,
          maxLines: 7,
          softWrap: true,
        ),
      ),
    ),
  );

  //Column3
  Widget archCard() => Container(
    height: deviceSize.height / 2.42,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Architecture",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
          ),
          Image.asset(UIData.mobileNetArch,height: 350, ),
        ],
      ),
    ),
  );

  //column4
  Widget accountColumn() => FittedBox(
    fit: BoxFit.fill,
    child: Container(
      height: deviceSize.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.cover,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ProfileTile(
                  title: "Research Paper",
                ),
                Hyperlink('https://arxiv.org/pdf/1612.08242.pdf', 'https://arxiv.org/pdf/1612.08242.pdf'),
                SizedBox(
                  height: 10.0,
                ),
                ProfileTile(
                  title: "Download Model",
                ),
                Hyperlink('https://github.com/shaqian/flutter_tflite/blob/master/example/assets/yolov2_tiny.tflite', 'TFLite YOLOv2 Model'),
                SizedBox(
                  height: 10.0,
                ),
                ProfileTile(
                  title: "YOLO Reference",
                ),
                Hyperlink('https://pjreddie.com/darknet/yolov2/', 'YOLOv2 - Overview'),
              ],
            ),
          ),
        ],
      ),
    ),
  );

}
