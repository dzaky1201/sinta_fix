import 'package:flutter/material.dart';
import 'package:sinta_fix/commons/colors.dart';
import 'package:sinta_fix/commons/sizes.dart';
import 'package:sinta_fix/model/response_movie.dart';

class Detailmovie extends StatelessWidget {
  Result itemMovie;

  Detailmovie(this.itemMovie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPallete.primary,
        title: Text('Detail Movie'),
      ),

      body: Column(
        children: <Widget>[
          Image.network('https://image.tmdb.org/t/p/w500${itemMovie.posterPath}',
          width: Sizes.width(context),
          height: 200,
          fit: BoxFit.fill,),
          Text('${itemMovie.title}'),
          Text('${itemMovie.overview}'),
          Text('${itemMovie.popularity}'),
          Text('${itemMovie.originalTitle}'),
          Text('${itemMovie.voteCount}'),
          Text('${itemMovie.voteAverage}'),
        ],
      ),
    );
  }
}
