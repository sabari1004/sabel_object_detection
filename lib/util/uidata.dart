import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class UIData {
  //routes
  static const String homeRoute = "/home";
  static const String profileOneRoute = "/View Profile";
  static const String profileTwoRoute = "/Profile 2";
  static const String overviewMobileNet = "/Overview - MobileNet";
  static const String detailsMobileNet = "/MobileNet Details";
  static const String classesMobileNet = "/MobileNet Classes";
  static const String testMobileNet = "/Test MobileNet Model";
  static const String overviewSSD = "/Overview - SSD MobileNet";
  static const String detailsSSD = "/SSD MobileNet Details";
  static const String classesSSD = "/SSD MobileNet Classes";
  static const String testSSD = "/Test SSD Model";
  static const String overviewYOLOv2 = "/Overview - YOLOv2";
  static const String detailsYOLOv2 = "/YOLOv2 Details";
  static const String classesYOLOv2 = "/YOLOv2 Classes";
  static const String testYOLOv2 = "/Test YOLOv2 Model";
  static const String overviewPoseNet = "/Overview - PoseNet";
  static const String detailsPoseNet = "/PoseNet Details";
  static const String classesPoseNet = "/PoseNet Classes";
  static const String testPoseNet = "/Test PoseNet Model";
  static const String overviewFlowerNet = "/Overview - FlowerNet";
  static const String detailsFlowerNet = "/FlowerNet Details";
  static const String classesFlowerNet = "/FlowerNet Classes";
  static const String testFlowerNet = "/Test FlowerNet Model";
  static const String overviewAnimalNet = "/Overview - AnimalNet";
  static const String detailsAnimalNet = "/AnimalNet Details";
  static const String classesAnimalNet = "/AnimalNet Classes";
  static const String testAnimalNet = "/Test AnimalNet Model";
  static const String overviewPlantNet = "/Overview - PlantNet";
  static const String detailsPlantNet = "/PlantNet Details";
  static const String classesPlantNet = "/PlantNet Classes";
  static const String testPlantNet = "/Test PlantNet Model";
  static const String overviewDeepLab = "/Overview - DeepLab";
  static const String detailsDeepLab = "/DeepLab Details";
  static const String classesDeepLab = "/DeepLab Classes";
  static const String testDeepLab = "/Test DeepLab Model";

  //strings
  static const String appName = "Machine Learning Models";
  static const String companyId = "1";
  static String empID;
  static const String adUnitID =  "ca-app-pub-2775942683310913/3460006358";

  //fonts
  static const String quickFont = "Quicksand";
  static const String ralewayFont = "Raleway";
  static const String quickBoldFont = "Quicksand_Bold.otf";
  static const String quickNormalFont = "Quicksand_Book.otf";
  static const String quickLightFont = "Quicksand_Light.otf";

  //images
  static const String imageDir = "assets/images";
  //static const String pkImage = "$imageDir/pk.jpg";
  static const String profileImage = "$imageDir/profile.jpg";
  static const String blankImage = "$imageDir/blank.jpg";
  static const String dashboardImage = "$imageDir/dashboard.jpg";
  static const String loginImage = "$imageDir/login.jpg";
  static const String paymentImage = "$imageDir/payment.jpg";
  static const String settingsImage = "$imageDir/setting.jpeg";
  static const String shoppingImage = "$imageDir/shopping.jpeg";
  static const String timelineImage = "$imageDir/timeline.jpeg";
  static const String verifyImage = "$imageDir/verification.jpg";
  static const String logoImage = "$imageDir/logo.png";
  static const String mobileNetArch = "$imageDir/MobileNet.png";
  static const String poseNetArch = "$imageDir/PoseNet.png";

  //login
  static const String enter_code_label = "Phone Number";
  static const String enter_code_hint = "10 Digit Phone Number";
  static const String enter_otp_label = "OTP";
  static const String enter_otp_hint = "4 Digit OTP";
  static const String get_otp = "Get OTP";
  static const String resend_otp = "Resend OTP";
  static const String login = "Login";
  static const String enter_valid_number = "Enter 10 digit phone number";
  static const String enter_valid_otp = "Enter 4 digit otp";

  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String forgot_password = "Forgot Password?";
  static const String something_went_wrong = "Something went wrong";
  static const String coming_soon = "Coming Soon";

  static const MaterialColor ui_kit_color = Colors.grey;

//colors
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];
  static List<Color> kitGradients2 = [
    Colors.cyan.shade600,
    Colors.blue.shade900
  ];

  //randomcolor
  static final Random _random = new Random();

  /// Returns a random color.
  static Color next() {
    return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}
