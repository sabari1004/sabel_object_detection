import 'package:flutter/material.dart';
import 'package:sabel_object_detection/util/CommonScaffold.dart';

class ClassesSSD extends StatelessWidget {
  Size deviceSize;

  //Title
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return CommonScaffold(
      appTitle: "SSD MobileNet Classes",
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
                    "List of objects which can be detected by SSD MobileNet",
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
              "1.     ???\n"
                  "2.     person\n"
                  "3.     bicycle\n"
                  "4.     car\n"
                  "5.     motorcycle\n"
                  "6.     airplane\n"
                  "7.     bus\n"
                  "8.     train\n"
                  "9.     truck\n"
                  "10.     boat\n"
                  "11.     traffic light\n"
                  "12.     fire hydrant\n"
                  "13.     ???\n"
                  "14.     stop sign\n"
                  "15.     parking meter\n"
                  "16.     bench\n"
                  "17.     bird\n"
                  "18.     cat\n"
                  "19.     dog\n"
                  "20.     horse\n"
                  "21.     sheep\n"
                  "22.     cow\n"
                  "23.     elephant\n"
                  "24.     bear\n"
                  "25.     zebra\n"
                  "26.     giraffe\n"
                  "27.     ???\n"
                  "28.     backpack\n"
                  "29.     umbrella\n"
                  "30.     ???\n"
                  "31.     ???\n"
                  "32.     handbag\n"
                  "33.     tie\n"
                  "34.     suitcase\n"
                  "35.     frisbee\n"
                  "36.     skis\n"
                  "37.     snowboard\n"
                  "38.     sports ball\n"
                  "39.     kite\n"
                  "40.     baseball bat\n"
                  "41.     baseball glove\n"
                  "42.     skateboard\n"
                  "43.     surfboard\n"
                  "44.     tennis racket\n"
                  "45.     bottle\n"
                  "46.     ???\n"
                  "47.     wine glass\n"
                  "48.     cup\n"
                  "49.     fork\n"
                  "50.     knife\n"
                  "51.     spoon\n"
                  "52.     bowl\n"
                  "53.     banana\n"
                  "54.     apple\n"
                  "55.     sandwich\n"
                  "56.     orange\n"
                  "57.     broccoli\n"
                  "58.     carrot\n"
                  "59.     hot dog\n"
                  "60.     pizza\n"
                  "61.     donut\n"
                  "62.     cake\n"
                  "63.     chair\n"
                  "64.     couch\n"
                  "65.     potted plant\n"
                  "66.     bed\n"
                  "67.     ???\n"
                  "68.     dining table\n"
                  "69.     ???\n"
                  "70.     ???\n"
                  "71.     toilet\n"
                  "72.     ???\n"
                  "73.     tv\n"
                  "74.     laptop\n"
                  "75.     mouse\n"
                  "76.     remote\n"
                  "77.     keyboard\n"
                  "78.     cell phone\n"
                  "79.     microwave\n"
                  "80.     oven\n"
                  "81.     toaster\n"
                  "82.     sink\n"
                  "83.     refrigerator\n"
                  "84.     ???\n"
                  "85.     book\n"
                  "86.     clock\n"
                  "87.     vase\n"
                  "88.     scissors\n"
                  "89.     teddy bear\n"
                  "90.     hair drier\n"
                  "91.     toothbrush\n",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
              textAlign: TextAlign.start,
              maxLines: 1001,
            ),
      );
}
