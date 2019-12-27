import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:discover_package/discover_package.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ServiceModelItem> serviceList;
  ServiceModel serviceModel;
  PageController pageViewController;

  @override
  void initState() {
    super.initState();
    serviceModel = ServicesService().getServiceModel();
    serviceList = ServicesFactory().convertToServiceModel(serviceModel);
    pageViewController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "服务",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xff000000),
          elevation: 2.0,
        ),
        body: ListView.builder(
          itemCount: serviceList == null ? 1 : (serviceList.length + 1),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {  //pageView
              return Container(
                alignment: Alignment.center,
                height: 130,
                child: PageView.builder(
                  itemBuilder: ((context, index) {
                    return GridTile(
                      child: Image.network(
                        serviceModel.news[index].bannerImageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                      footer: Container(
                        height: 40,
                        decoration: BoxDecoration(color: Color(0x88000000)),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                              serviceModel.news[index].serviceTitle,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                        ),
                        ),
                      ),
                    );
                  }),
                  itemCount: serviceModel.news.length,
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  controller: pageViewController,
                  physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
                  onPageChanged: (index) {
                    print(index);
                  },
                ),
              );
            } else {
              if (serviceList[index - 1].type == 1) {
                //分类名
                String name = serviceList[index - 1].groupName;
                return Container(
                  decoration: new BoxDecoration(color: Colors.black),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    "$name",
                    style: new TextStyle(
                        color: Colors.white, backgroundColor: Colors.black),
                  ),
                );
              } else {
                //一行九宫格
                var servicesItem = serviceList[index - 1].servicesItems;
                return Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Opacity(
                        opacity:
                        serviceList[index - 1].servicesItems.length > 0
                            ? 1.0
                            : 0.0,
                        child: Container(
                          width: 110,
                          height: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0x99282A2C),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                serviceList[index - 1].servicesItems.length > 0
                                    ? servicesItem[0].image
                                    : "",
                                width: 50,
                                height: 50,
                              ),
                              Text(
                                serviceList[index - 1].servicesItems.length > 0
                                    ? servicesItem[0].name
                                    : "",
                                style: new TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Opacity(
                        opacity:
                        serviceList[index - 1].servicesItems.length > 1
                            ? 1.0
                            : 0.0,
                        child: Container(
                          width: 110,
                          height: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0x99282A2C),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                serviceList[index - 1].servicesItems.length > 1
                                    ? servicesItem[1].image
                                    : "",
                                width: 50,
                                height: 50,
                              ),
                              Text(
                                serviceList[index - 1].servicesItems.length > 1
                                    ? servicesItem[1].name
                                    : "",
                                style: new TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: serviceList[index - 1].servicesItems.length > 2
                            ? 1.0
                            : 0.0,
                        child: Container(
                          width: 110,
                          height: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0x99282A2C),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                serviceList[index - 1].servicesItems.length > 2
                                    ? servicesItem[2].image
                                    : "",
                                width: 50,
                                height: 50,
                              ),
                              Text(
                                serviceList[index - 1].servicesItems.length > 2
                                    ? servicesItem[2].name
                                    : "",
                                style: new TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ));
  }
}
