import 'package:flutter/widgets.dart';
import '../models/picture.dart';
import 'dart:io';

class Pictures with ChangeNotifier{
List<Picture> _items = [];

  List<Picture> get items {
    return [..._items];
  }


  storeImage(Picture pickedImage)  {
    final newImage = Picture(
      picName: pickedImage.picName,
    );
    _items.add(newImage);
    print("New image added");
    notifyListeners();
  }

  //Constructor for pre-loading images
  Pictures(){
    final directory = '/storage/emulated/0/Android/data/cogniaapp.cognia_app/files/MyPeople/';
    final myImgDir = Directory(directory);

  }
}