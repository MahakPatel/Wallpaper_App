import 'package:wallpaper_app/models/category_models.dart';

List<CategoriesModels> getCategories(){

  String apiKey ="563492ad6f91700001000001574cd7077d884e68995eb5b7691fe656";

  List<CategoriesModels> categories = List();
  CategoriesModels categoriesModels = CategoriesModels();

  //
  categoriesModels.imgaeUrl=
  "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModels.categoriesName = "Street Art";
  categories.add(categoriesModels);
  categoriesModels = new CategoriesModels();

  //
  categoriesModels.imgaeUrl=
  "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModels.categoriesName = "Wild Life";
  categories.add(categoriesModels);
  categoriesModels = new CategoriesModels();

  //
  categoriesModels.imgaeUrl =
  "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModels.categoriesName= "Nature";
  categories.add(categoriesModels);
  categoriesModels = new CategoriesModels();

  //
  categoriesModels.imgaeUrl =
  "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModels.categoriesName = "City";
  categories.add(categoriesModels);
  categoriesModels = new CategoriesModels();

  //
  categoriesModels.imgaeUrl=
  "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModels.categoriesName= "Motivation";

  categories.add(categoriesModels);
  categoriesModels = new CategoriesModels();

  //
  categoriesModels.imgaeUrl =
  "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModels.categoriesName= "Bikes";
  categories.add(categoriesModels);
  categoriesModels = new CategoriesModels();

  //
  categoriesModels.imgaeUrl =
  "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModels.categoriesName= "Cars";
  categories.add(categoriesModels);
  categoriesModels = new CategoriesModels();

  return categories;

}