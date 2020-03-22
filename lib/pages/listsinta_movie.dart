import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sinta_fix/commons/colors.dart';
import 'package:sinta_fix/commons/sizes.dart';
import 'package:sinta_fix/model/response_movie.dart';
import 'package:http/http.dart' as http;
import 'package:sinta_fix/pages/detail_movie.dart';

class ListSintaPageMovie extends StatefulWidget {
  @override
  _ListSintaPageMovieState createState() => _ListSintaPageMovieState();
}

class _ListSintaPageMovieState extends State<ListSintaPageMovie> {

  List<Result> listMovie = [];

  void getDataMovie()async{

    String url = 'https://api.themoviedb.org/3/movie/popular?api_key=99e9a8a9f7993100cfe848d86fdbbe26&language=en-US&page=1';
    var response = await http.get(url);
    if (response.statusCode==200) {
      var data = response.body;
      Map json = jsonDecode(data);
      ResponseMovie dataResponseMovie = ResponseMovie.fromJson(json);

      setState(() {
        listMovie = dataResponseMovie.results;
      });



    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataMovie();
  }

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
        child: listMovie.length == 0
          ? Center(
            child: CircularProgressIndicator(
            backgroundColor: ColorPallete.primary,),
          )
          :ListView.builder(
            padding: EdgeInsets.all(Sizes.dp14(context)),
            itemCount: listMovie.length,
            itemBuilder: (context, index) {

              Result itemMovie = listMovie[index];
              String urlImage = 'https://image.tmdb.org/t/p/w500';
              return InkWell(
                onTap: (){
                  var route = MaterialPageRoute(
                      builder: (context)=> Detailmovie(itemMovie));
                  Navigator.push(context, route);
                },
                  child: itemListJurnal(urlImage+itemMovie.posterPath, itemMovie.title, itemMovie.overview));
            }),
      ),
    );
  }

  Widget itemListJurnal(String urlImage, String title, String subTitle){
    return Container(
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
                urlImage,
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
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: ColorPallete.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.dp20(context)),
                    ),
                    SizedBox(width: Sizes.dp6(context),),
                    Text(
                      subTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
    );
  }
}
