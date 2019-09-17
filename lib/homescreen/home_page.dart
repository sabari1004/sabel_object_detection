import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'menu_bloc.dart';
import 'menu.dart';
import 'about_tile.dart';
import 'profile_tile.dart';

import 'package:sabel_object_detection/util/uidata.dart';
import 'package:camera/camera.dart';
import 'package:firebase_admob/firebase_admob.dart';

class HomePage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  Size deviceSize;
  BuildContext _context;
  final List<CameraDescription> cameras;

  HomePage(this.cameras);
  //menuStack
  Widget menuStack(BuildContext context, Menu menu) => InkWell(
    onTap: () => _showModalBottomSheet(context, menu),
    splashColor: Colors.orange,
    child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          menuImage(menu),
          menuColor(),
          menuData(menu),
        ],
      ),
    ),
  );

  //stack 1/3
  Widget menuImage(Menu menu) => Image.asset(
    menu.image,
    fit: BoxFit.cover,
  );

  //stack 2/3
  Widget menuColor() => new Container(
    decoration: BoxDecoration(boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(0.8),
        blurRadius: 5.0,
      ),
    ]),
  );

  //stack 3/3
  Widget menuData(Menu menu) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        menu.icon,
        color: Colors.white,
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        menu.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )
    ],
  );

  //appbar
  Widget appBar() => SliverAppBar(
    title: Row(
      children: <Widget>[
        Image.asset(UIData.logoImage,height: 50.0,),
        /*SizedBox(
          width: 10.0,
        ),*/
        Text(UIData.appName, style: TextStyle(
            fontSize: 20.0
        ),)
      ],
    ),

/*    backgroundColor: Colors.black,
    pinned: true,
    elevation: 10.0,
    forceElevated: true,
    expandedHeight: 150.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: false,
      background: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients)),
      ),
      title: Row(
        children: <Widget>[
          Image.asset(UIData.logoImage),
          SizedBox(
            width: 10.0,
          ),
          Text(UIData.appName)
        ],
      ),
    ),*/
  );

  //bodygrid
  Widget bodyGrid(List<Menu> menu) => SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:
      MediaQuery.of(_context).orientation == Orientation.portrait
          ? 2
          : 3,
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      childAspectRatio: 1.0,
    ),
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return menuStack(context, menu[index]);
    }, childCount: menu.length),
  );

  Widget homeScaffold(BuildContext context) => Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Colors.transparent,
    ),
    child: Scaffold(key: _scaffoldState, body: bodySliverList()),
  );

  Widget bodySliverList() {
    MenuBloc menuBloc = MenuBloc();
    return StreamBuilder<List<Menu>>(
        stream: menuBloc.menuItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
            slivers: <Widget>[
              appBar(),
              bodyGrid(snapshot.data),
            ],
          )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget header() => Ink(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: UIData.kitGradients2)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /*CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage(UIData.profileImage),
          ),*/
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: ProfileTile(
              title: "Machine Learning Model Details",
              //subtitle: "mtechviral@gmail.com",
              textColor: Colors.white,
            ),
          )
        ],
      ),
    ),
  );

  void _showModalBottomSheet(BuildContext context, Menu menu) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(15.0),
                    topRight: new Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                header(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: menu.items.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListTile(
                          title: Text(
                            menu.items[i],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, "/${menu.items[i]}");
                          }),
                    ),
                  ),
                ),
                MyAboutTile()
              ],
            )));
  }

  Widget iosCardBottom(Menu menu, BuildContext context) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 40.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 3.0, color: Colors.white),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    menu.image,
                  ))),
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          menu.title,
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 20.0,
        ),
        FittedBox(
          child: CupertinoButton(
            onPressed: () => _showModalBottomSheet(context, menu),
            borderRadius: BorderRadius.circular(50.0),
            child: Text(
              "Go",
              textAlign: TextAlign.left,
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
            color: Colors.white,
          ),
        )
      ],
    ),
  );

  Widget menuIOS(Menu menu, BuildContext context) {
    return Container(
      height: deviceSize.height / 2,
      decoration: ShapeDecoration(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3.0,
        margin: EdgeInsets.all(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            menuImage(menu),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                menu.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              height: 60.0,
              child: Container(
                width: double.infinity,
                color: menu.menuColor,
                child: iosCardBottom(menu, context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyDataIOS(List<Menu> data, BuildContext context) => SliverList(
    delegate: SliverChildListDelegate(
        data.map((menu) => menuIOS(menu, context)).toList()),
  );

  Widget homeBodyIOS(BuildContext context) {
    MenuBloc menuBloc = MenuBloc();
    return StreamBuilder<List<Menu>>(
        stream: menuBloc.menuItems,
        initialData: List(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? bodyDataIOS(snapshot.data, context)
              : Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget homeIOS(BuildContext context) => Theme(
    data: ThemeData(
      fontFamily: '.SF Pro Text',
    ).copyWith(canvasColor: Colors.transparent),
    child: CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            border: Border(bottom: BorderSide.none),
            backgroundColor: CupertinoColors.white,
            largeTitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(UIData.appName),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: CupertinoColors.black,
                    child: Image.asset(UIData.logoImage),
                  ),
                )
              ],
            ),
          ),
          homeBodyIOS(context)
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-2775942683310913~7235599831").then((response){
      myBanner..load()..show();
    });
    _context = context;
    deviceSize = MediaQuery.of(context).size;
    return defaultTargetPlatform == TargetPlatform.iOS
        ? homeIOS(context)
        : homeScaffold(context);
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
// or MobileAdGender.female, MobileAdGender.unknown
  // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: UIData.adUnitID,
  //adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);
