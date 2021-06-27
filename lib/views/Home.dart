import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/models/category_models.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/views/category.dart';
import 'package:wallpaper_app/views/image_view.dart';
import 'package:wallpaper_app/views/search.dart';
import 'package:wallpaper_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {

  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModels> categories = List();
  List<WallpaperModel> wallpapers =List();
  TextEditingController searchController = TextEditingController();

  getTrandingWallpaers() async{
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=200&page=3",
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
    getTrandingWallpaers();
    categories = getCategories();
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(searchQuery :searchController.text)));
                        },
                        child: Container(child: Icon(Icons.search))),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 90,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoriesTile(
                        title: categories[index].categoriesName,
                        imageUrl: categories[index].imgaeUrl,
                      );
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              WallpaperList(wallpapers: wallpapers,context: context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imageUrl, title;

  CategoriesTile({@required this.title, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>categories(
          categorieName: title.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  height: 70,
                  width: 110,
                  fit: BoxFit.cover,
                )),
            Container(

              height: 70,
              width: 110,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
