import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;

  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpapers =List();

  getSearchWallpaers(String query) async{
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=200&page=2",
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
    getSearchWallpaers(widget.searchQuery);
    // TODO: implement initState
    super.initState();
    searchController.text = widget.searchQuery;
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
              Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: (){
                            getSearchWallpaers(searchController.text);
                        },
                        child: Container(child: Icon(Icons.search))),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              WallpaperList(wallpapers: wallpapers,context: context),
            ],
          ),
        ),
      ),


    );
  }
}
