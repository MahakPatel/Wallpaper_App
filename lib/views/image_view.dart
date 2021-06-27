import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imageUrl;
  ImageView({@required this.imageUrl});


  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imageUrl ,
            child: Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imageUrl,fit: BoxFit.cover,)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               GestureDetector(
                 onTap: (){
                  _save();

          },
                 child: Stack(
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width/2,
                       height: 60,

                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         color: Color(0Xff1C1B1B).withOpacity(0.8),
                       ),
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width/2,
                       height: 60,
                       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                       decoration: BoxDecoration(
                           border: Border.all(color: Colors.white38,width: 1),
                           borderRadius: BorderRadius.circular(30),
                           gradient: LinearGradient(
                               colors: [
                                 Color(0x36FFFFFF),
                                 Color(0X0FFFFFFF),
                               ]
                           )
                       ),
                       child: Column(
                         children: [
                           Text("Set Wallpaper",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 16)),
                           SizedBox(height: 5,),
                           Text("Image Will be save in gallery",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w500,fontSize: 12),)
                         ],
                       ),
                     ),
                   ],

                 ),
               ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 80,),
              ],
            ),

          )
        ],
        
      ),

    );
  }

  _save() async{
    if(Platform.isAndroid){
      await _askPermission();
    }
    var response = await Dio().get(widget.imageUrl,
    options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    Navigator.pop(context);
  }

  _askPermission() async{
    if(Platform.isIOS || Platform.isAndroid){
      Map<PermissionGroup,PermissionStatus> permission =  await PermissionHandler().requestPermissions([PermissionGroup.photos]);

    }
    else{
      PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }
  }
}
