import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinta_fix/commons/colors.dart';
import 'package:sinta_fix/pages/homepage.dart';
import 'package:sinta_fix/pages/listsinta_movie.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: ColorPallete.primary));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
