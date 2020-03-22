import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sinta_fix/commons/colors.dart';
import 'package:sinta_fix/commons/sizes.dart';
import 'package:sinta_fix/pages/listsinta.dart';
import 'package:sinta_fix/pages/listsinta_movie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //untuk navigasi disamping
  var _scafoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scafoldKey,
      drawer: Drawer(
        child: Material(
          color: ColorPallete.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: statusBar +16.0, left: 16.0, bottom: Sizes.height(context)/8),
                  child: Align(
                    alignment: Alignment.topLeft,
                      child: Image.asset('assets/sinta.png', scale: 4.0,)
                  )
              ),

              Column(
                children: <Widget>[
                  ListTile(
                    onTap: (){},
                    title: Text('Authors', style: TextStyle(color: ColorPallete.white),),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text('Affilition', style: TextStyle(color: ColorPallete.white),),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text('Research', style: TextStyle(color: ColorPallete.white),),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text('Community Service', style: TextStyle(color: ColorPallete.white),),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text('FaQ', style: TextStyle(color: ColorPallete.white),),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text('About', style: TextStyle(color: ColorPallete.white),),
                  ),

                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/wayang.png', scale: 6.0,),
                ),
              )
            ],
          ),
        ),
      ),
      body: NotificationListener(
        // ignore: missing_return
        onNotification: (OverscrollIndicatorNotification notification){
          notification.disallowGlow();
        },
        child: ListView(
          children: <Widget>[
            headerApp(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: menuBar(),
            ),
            infoGrapich(),
          ],
        ),
      ),
    );
  }

  Widget headerApp() {
    double heightHeader = Sizes.height(context) / 3.5;
    return Container(
      height: heightHeader,
      padding: EdgeInsets.all(Sizes.dp16(context)),
      decoration: BoxDecoration(
          color: ColorPallete.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              _scafoldKey.currentState.openDrawer();
            },
            child: Image.asset(
              'assets/btn_navbar.png',
              scale: 3.5,
            ),
          ),
          SizedBox(
            height: heightHeader / 20.0,
          ),
          Center(
            child: Image.asset(
              'assets/sinta.png',
              scale: 4.0,
            ),
          ),
          SizedBox(
            height: heightHeader / 8.0,
          ),
          Container(
            height: heightHeader / 5.5,
            child: TextField(
              onSubmitted: (inputUser) {
                //aksi search
                print(inputUser);
              },
              cursorColor: ColorPallete.primary,
              decoration: InputDecoration(
                hintText: 'Search Something',
                contentPadding: EdgeInsets.zero,
                prefixIcon: Image.asset('assets/search.png', scale: 4.5),
                fillColor: ColorPallete.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.width(context)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget menuBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(children: <Widget>[
          RaisedButton(
            color: ColorPallete.orange,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadiusDirectional.circular(Sizes.width(context)),
            ),
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListSintaPageMovie()));
            },
            child: Image.asset(
              'assets/jurnal.png',
              scale: 4.0,
            ),
          ),
          Text(
            'Jurnals',
            style: TextStyle(
                color: ColorPallete.primary, fontWeight: FontWeight.bold),
          )
        ]),
        Column(children: <Widget>[
          RaisedButton(
            color: ColorPallete.orange,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadiusDirectional.circular(Sizes.width(context)),
            ),
            onPressed: () {},
            child: Image.asset(
              'assets/book.png',
              scale: 4.0,
            ),
          ),
          Text(
            'Books',
            style: TextStyle(
                color: ColorPallete.primary, fontWeight: FontWeight.bold),
          )
        ]),
        Column(children: <Widget>[
          RaisedButton(
            color: ColorPallete.orange,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadiusDirectional.circular(Sizes.width(context)),
            ),
            onPressed: () {},
            child: Image.asset(
              'assets/jurnals2.png',
              scale: 4.0,
            ),
          ),
          Text(
            'IPRs',
            style: TextStyle(
                color: ColorPallete.primary, fontWeight: FontWeight.bold),
          )
        ])
      ],
    );
  }

  Widget infoGrapich() {
    return Container(
      padding: EdgeInsets.all(Sizes.dp16(context)),
      decoration: BoxDecoration(
        color: ColorPallete.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              height: Sizes.height(context) / 4.5,
              margin: EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                color: ColorPallete.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              )),
          Container(
              height: Sizes.height(context) / 4.5,
              margin: EdgeInsets.only(bottom: 26.0),
              decoration: BoxDecoration(
                color: ColorPallete.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              )),
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                    padding: EdgeInsets.all(Sizes.dp14(context)),
                    height: Sizes.height(context) / 6,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Top 50 Authors',
                          style: TextStyle(
                              fontSize: Sizes.dp22(context),
                              color: ColorPallete.white,
                          fontWeight: FontWeight.bold),
                        )
                    ),
                      decoration: BoxDecoration(
                      color: ColorPallete.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    )),
              ),
              SizedBox(
                width: Sizes.dp12(context),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                    padding: EdgeInsets.all(Sizes.dp14(context)),
                    height: Sizes.height(context) / 6,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
//                        Image.asset('assets/wayang.png'),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Top Affiliation',
                              style: TextStyle(
                                  fontSize: Sizes.dp22(context),
                                  color: ColorPallete.white,
                                  fontWeight: FontWeight.bold),
                            )
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: ColorPallete.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 14.0),
            child: Text('Publication for year',
              style: TextStyle(color: ColorPallete.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.dp20(context)),),
          ),
          Container(
              height: Sizes.height(context) / 4.5,
              margin: EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                color: ColorPallete.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              )),
          Container(
              height: Sizes.height(context) / 4.5,
              margin: EdgeInsets.only(bottom: 26.0),
              decoration: BoxDecoration(
                color: ColorPallete.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ))
        ],
      ),
    );
  }
}
