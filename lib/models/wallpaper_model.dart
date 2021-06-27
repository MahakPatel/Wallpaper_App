class WallpaperModel{
  String photographer;
  String photographerr_url;
  int photographer_id;
  SrcModel src;


  WallpaperModel({this.photographer,this.photographer_id,this.photographerr_url,this.src});

  factory WallpaperModel.fromMap(Map<String,dynamic> jsonData){
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographerr_url: jsonData["photographer_url"],
      photographer_id: jsonData["photographer_id"],
      photographer: jsonData["photographer"],


    );
  }
}

class SrcModel{
  String original;
  String small;
  String portrait;

  SrcModel({this.original,this.portrait,this.small});
  factory SrcModel.fromMap(Map<String,dynamic>jsonDta){
    return SrcModel(
      portrait: jsonDta["portrait"],
      original: jsonDta["original"],
      small: jsonDta["small"],
    );
  }
}