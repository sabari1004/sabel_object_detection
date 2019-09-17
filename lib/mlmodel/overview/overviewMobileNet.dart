import 'package:flutter/material.dart';
import 'package:sabel_object_detection/util/CommonScaffold.dart';
import 'package:sabel_object_detection/util/ProfileTile.dart';
import 'package:sabel_object_detection/util/Hyperlink.dart';
import 'package:sabel_object_detection/util/uidata.dart';

class OverviewMobileNet extends StatelessWidget {
  Size deviceSize;

  //Title
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return CommonScaffold(
      appTitle: "Overview - MobileNet Model",
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
                "MobileNet - Efficient CNN for Mobile Vision Applications",
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
          "           MobileNet is a  ML model architecture which is more suitable for edge devices like mobile and embedded devices for computer vision applications, where there is a lack of computation power. This architecture was proposed by Google Researchers. It is based on depthwise separable convolutions which is a form of factorized convolutions which factorize a standard convolution into a depthwise convolution and a 1×1 convolution called a pointwise convolution.",
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
                Hyperlink('https://arxiv.org/pdf/1704.04861.pdf', 'MobileNets: Efficient Convolutional Neural Networks for Mobile Vision Applications'),
                SizedBox(
                  height: 10.0,
                ),
                ProfileTile(
                  title: "Download Model",
                ),
                Hyperlink('https://storage.googleapis.com/download.tensorflow.org/models/tflite/mobilenet_v1_1.0_224_quant_and_labels.zip', 'TFLite MobileNet-224 v1.1.0'),
                SizedBox(
                  height: 10.0,
                ),
                ProfileTile(
                  title: "TensorFlow Lite Reference",
                ),
                Hyperlink('https://www.tensorflow.org/lite/models/image_classification/overview', 'TFLite Image classification - Overview'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

