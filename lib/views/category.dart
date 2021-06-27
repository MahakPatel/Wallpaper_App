import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/widgets/widgets.dart';

class categories extends StatefulWidget {

  final String categorieName;
  categories({this.categorieName});

  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List<WallpaperModel> wallpapers =List();

  getSearchWallpaers(String query) async{
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=50&page=3",
        headers: {"Authorization": "563492ad6f91700001000001574cd7077d884e68995eb5b7691fe656"});

    Map<String,dynamic> jsondata = jsonDecode(response.body);
    jsondata["photos"].forEach((element){
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);

    });
    setState(() {

    });
  }


  @override
  void initState() {
    getSearchWallpaers(widget.categorieName);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20,),
              WallpaperList(wallpapers: wallpapers,context: context),
            ],
          ),
        ),
      ),
    );
  }
}
