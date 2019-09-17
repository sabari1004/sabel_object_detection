import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:sabel_object_detection/homescreen/home_page.dart';
import 'package:sabel_object_detection/util/uidata.dart';
import 'package:sabel_object_detection/mlmodel/overview/overviewMobileNet.dart';
import 'package:sabel_object_detection/mlmodel/overview/overviewAnimalNet.dart';
import 'package:sabel_object_detection/mlmodel/overview/overviewFlowerNet.dart';
import 'package:sabel_object_detection/mlmodel/overview/overviewDeepLab.dart';
import 'package:sabel_object_detection/mlmodel/overview/overviewPlantNet.dart';
import 'package:sabel_object_detection/mlmodel/overview/overviewSSD.dart';
import 'package:sabel_object_detection/mlmodel/overview/overviewYOLOv2.dart';
import 'package:sabel_object_detection/mlmodel/overview/overviewPoseNet.dart';
import 'package:sabel_object_detection/mlmodel/classes/classesMobileNet.dart';
import 'package:sabel_object_detection/mlmodel/classes/classesSSD.dart';
import 'package:sabel_object_detection/mlmodel/classes/classesPoseNet.dart';
import 'package:sabel_object_detection/mlmodel/classes/classesDeepLab.dart';
import 'package:sabel_object_detection/mlmodel/testModel/testMobileNet.dart';
import 'package:sabel_object_detection/mlmodel/testModel/testSSD.dart';
import 'package:sabel_object_detection/mlmodel/testModel/testPoseNet.dart';
import 'package:sabel_object_detection/mlmodel/testModel/testYOLOv2.dart';
import 'package:sabel_object_detection/mlmodel/testModel/testDeepLab.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(cameras),
        //routes
        routes: <String, WidgetBuilder>{
          UIData.homeRoute: (BuildContext context) => HomePage(cameras),
          UIData.overviewAnimalNet: (BuildContext context) => OverviewAnimalNet(),
          UIData.overviewFlowerNet: (BuildContext context) => OverviewFlowerNet(),
          UIData.overviewDeepLab: (BuildContext context) => OverviewDeepLab(),
          UIData.overviewMobileNet: (BuildContext context) => OverviewMobileNet(),
          UIData.overviewPlantNet: (BuildContext context) => OverviewPlantNet(),
          UIData.overviewPoseNet: (BuildContext context) => OverviewPoseNet(),
          UIData.overviewSSD: (BuildContext context) => OverviewSSD(),
          UIData.overviewYOLOv2: (BuildContext context) => OverviewYOLOv2(),
          UIData.classesMobileNet: (BuildContext context) => ClassesMobileNet(),
          UIData.classesSSD: (BuildContext context) => ClassesSSD(),
          UIData.classesPoseNet: (BuildContext context) => ClassesPoseNet(),
          UIData.classesDeepLab: (BuildContext context) => ClassesDeepLab(),
          UIData.testMobileNet: (BuildContext context) => MobileNetModel(cameras),
          UIData.testSSD: (BuildContext context) => SSDModel(cameras),
          UIData.testPoseNet: (BuildContext context) => PoseNetModel(cameras),
          UIData.testYOLOv2: (BuildContext context) => YOLOv2Model(cameras),
          UIData.testDeepLab: (BuildContext context) => DeepLabModel(cameras),
        },
    );
  }
}
