import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import 'package:sabel_object_detection/mlmodel/modelUtils/camera.dart';
import 'package:sabel_object_detection/mlmodel/modelUtils/bndbox.dart';

class DeepLabModel extends StatefulWidget {
  final List<CameraDescription> cameras;
  DeepLabModel(this.cameras);

  @override
  _DeepLabState createState() => new _DeepLabState();
}

class _DeepLabState extends State<DeepLabModel> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "DeepLab";

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  loadModel() async {
    String res;
    res = await Tflite.loadModel(
      model: "assets/deeplabv3_257_mv_gpu.tflite",
      labels: "assets/deeplabv3_257_mv_gpu.txt");
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Camera(
            widget.cameras,
            _model,
            setRecognitions,
          ),
          BndBox(
              _recognitions == null ? [] : _recognitions,
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              _model),
        ],
      ),
    );
  }
}
