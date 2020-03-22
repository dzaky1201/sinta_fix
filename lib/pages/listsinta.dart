import 'package:flutter/material.dart';
import 'package:sinta_fix/commons/colors.dart';
import 'package:sinta_fix/commons/sizes.dart';

class ListSintaPage extends StatefulWidget {
  @override
  _ListSintaPageState createState() => _ListSintaPageState();
}

class _ListSintaPageState extends State<ListSintaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              headerListSinta(),
              Padding(
                padding: EdgeInsets.only(top: Sizes.height(context)/4),
                child: listJournal(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerListSinta() {
    return Container(
      height: Sizes.height(context) / 3.5,
      color: ColorPallete.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: Sizes.dp14(context), bottom: Sizes.dp8(context)),
                child: Text(
                  'Journals',
                  style: TextStyle(
                      color: ColorPallete.white,
                      fontSize: Sizes.dp36(context),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: Sizes.dp14(context), bottom: Sizes.dp8(context)),
                child: Text(
                  'Accridited Journals',
                  style: TextStyle(
                      color: ColorPallete.white,
                      fontSize: Sizes.dp18(context),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: Sizes.dp14(context)),
                child: Text(
                  '4000',
                  style: TextStyle(
                      color: ColorPallete.white,
                      fontSize: Sizes.dp28(context),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/wayang1.png',
              scale: 6.5,
            ),
          )
        ],
      ),
    );
  }

  Widget listJournal() {
    return Container(
      decoration: BoxDecoration(
        color: ColorPallete.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0)
        )
      ),
      child: NotificationListener(
        // ignore: missing_return
        onNotification: (OverscrollIndicatorNotification notifiaction){
          notifiaction.disallowGlow();
        },
        child: ListView.builder(
            padding: EdgeInsets.all(Sizes.dp14(context)),
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(bottom: Sizes.dp18(context)),
                  decoration: BoxDecoration(
                      color: ColorPallete.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorPallete.grey.withOpacity(0.5),
                          offset: Offset(0.0, 2.0),
                          spreadRadius: 0.4,
                          blurRadius: 5.0,
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dp16(context)),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          child: Image.network(
                            'https://lh3.googleusercontent.com/proxy/ZWkixtUoLyIeLbI-Et8BdytP5NNkeEQ9krNwVJcCeZn8B0piDVeRbODk_YcsjJD-VsnV51gd6zcVXm6kNNF5qJcM7iIoWgRNRw3bcCsCvMQ',
                            height: Sizes.height(context) / 7.5,
                          ),
                        ),
                        SizedBox(
                          width: Sizes.dp14(context),
                        ),
                        Expanded(
                          child: Container(
                            height: Sizes.height(context) / 7.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  'JUDUL CAKRAWALA PENDIDIKAN',
                                  style: TextStyle(
                                      color: ColorPallete.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.dp20(context)),
                                ),
                                SizedBox(width: Sizes.dp6(context),),
                                Text(
                                  'University of IDN Jonggol',
                                  style: TextStyle(
                                      color: ColorPallete.black,
                                      fontStyle: FontStyle.italic,
                                      fontSize: Sizes.dp16(context)),
                                ),
                                Spacer(),
                                Row(
                                  children: <Widget>[
                                    Image.asset('assets/ceklis.png'),
                                    Text(
                                      'Impact',
                                      style: TextStyle(
                                          color: ColorPallete.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Sizes.dp16(context)),
                                    ),
                                    Spacer(),
                                    Text(
                                      'scopus',
                                      style: TextStyle(
                                          color: ColorPallete.orange,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Sizes.dp16(context)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
