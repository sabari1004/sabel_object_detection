import 'package:flutter/material.dart';

import 'package:sabel_object_detection/util/uidata.dart';
import 'menu.dart';

class MenuViewModel {
  List<Menu> menuItems;

  MenuViewModel({this.menuItems});

  getMenuItems() {
    return menuItems = <Menu>[
      Menu(
          title: "MobileNet",
          menuColor: Color(0xffc8c4bd),
          icon: Icons.mobile_screen_share,
          image: UIData.shoppingImage,
          items: [
            "Overview - MobileNet",
            //"MobileNet Details",
            "MobileNet Classes",
            "Test MobileNet Model",
          ]),
      Menu(
          title: "SSD MobileNet",
          menuColor: Color(0xffc7d8f4),
          icon: Icons.add_a_photo,
          image: UIData.loginImage,
          items: [
            "Overview - SSD MobileNet",
            //"SSD MobileNet Details",
            "SSD MobileNet Classes",
            "Test SSD Model",
          ]),
      Menu(
          title: "Tiny YOLOv2",
          menuColor: Color(0xff7f5741),
          icon: Icons.monochrome_photos,
          image: UIData.timelineImage,
          items: [
            "Overview - YOLOv2",
            //"YOLOv2 Details",
            "YOLOv2 Classes",
            "Test YOLOv2 Model",
          ]),
      Menu(
          title: "PoseNet",
          menuColor: Color(0xff261d33),
          icon: Icons.accessibility_new,
          image: UIData.dashboardImage,
          items: [
            "Overview - PoseNet",
            //"PoseNet Details",
            "PoseNet Classes",
            "Test PoseNet Model",
          ]),
      Menu(
          title: "Image Segmentation",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.leak_add,
          image: UIData.settingsImage,
          items: [
            "Overview - DeepLab",
            //"LeafNet Details",
            "DeepLab Classes",
            "Test DeepLab Model",
          ]),
      Menu(
          title: "FlowerNet",
          menuColor: Color(0xff050505),
          icon: Icons.local_florist,
          image: UIData.profileImage,
          items: [
            "Overview - FlowerNet",
            //"FlowerNet Details",
            "FlowerNet Classes",
            "Test FlowerNet Model",
          ]),
      Menu(
          title: "AnimalNet",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.adb,
          image: UIData.settingsImage,
          items: [
            "Overview - AnimalNet",
            //"AnimalNet Details",
            "AnimalNet Classes",
            "Test AnimalNet Model",
          ]),
      Menu(
          title: "PlantNet",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.local_florist,
          image: UIData.settingsImage,
          items: [
            "Overview - PlantNet",
            //"PlantNet Details",
            "PlantNet Classes",
            "Test PlantNet Model",
          ]),
    ];
  }
}
