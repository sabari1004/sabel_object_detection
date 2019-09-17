import 'package:flutter/material.dart';
import 'package:sabel_object_detection/util/CommonScaffold.dart';
import 'package:sabel_object_detection/util/ProfileTile.dart';
import 'package:sabel_object_detection/util/Hyperlink.dart';
import 'package:sabel_object_detection/util/uidata.dart';

class OverviewPoseNet extends StatelessWidget {
  Size deviceSize;

  //Title
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return CommonScaffold(
      appTitle: "Overview - PoseNet Model",
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
                "PoseNet - Pose Estimation and Segmentation",
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
          "           PoseNet is a vision model that can be used to estimate the pose of a person in an image or video by estimating where key body joints are. Its main goal is to identify every person instance, localize its facial and body keypoints, and estimate its instance segmentation mask. A host of computer vision applications such as smart photo editing, person and activity recognition, virtual or augmented reality, and robotics can benefit from progress in these challenging tasks.",
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
    height: deviceSize.height / 3.2,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "PoseNet App Workflow",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
          ),
          Image.asset(UIData.poseNetArch,height: 250),
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
                  title: "Research Papers",
                ),
                Hyperlink('https://arxiv.org/pdf/1701.01779.pdf', 'Towards Accurate Multi-person Pose Estimation in the Wild'),
                Hyperlink('https://arxiv.org/pdf/1803.08225.pdf', 'PersonLab: Person Pose Estimation and Instance Segmentation'),
                SizedBox(
                  height: 10.0,
                ),
                ProfileTile(
                  title: "Download Model",
                ),
                Hyperlink('https://storage.googleapis.com/download.tensorflow.org/models/tflite/posenet_mobilenet_v1_100_257x257_multi_kpt_stripped.tflite', 'TFLite PoseNet v1'),
                SizedBox(
                  height: 10.0,
                ),
                ProfileTile(
                  title: "TensorFlow Lite Reference",
                ),
                Hyperlink('https://www.tensorflow.org/lite/models/pose_estimation/overview', 'TFLite Pose estimation - Overview'),
              ],
            ),
          ),
        ],
      ),
    ),
  );

}
