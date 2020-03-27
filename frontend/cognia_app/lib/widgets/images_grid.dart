import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pictures.dart';
import './image_item.dart';
import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;

class ImagesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imagesData = Provider.of<Pictures>(context);
    final images = imagesData.items;
    //print("Image items : ${images[0].picName}");

    List<File> fileList = [];
    Future<void> generateImageList() async{
      final directory = '/storage/emulated/0/Android/data/cogniaapp.cognia_app/files/MyPeople/';
      final myImgDir = Directory(directory);

      fileList = await myImgDir.list(recursive: true).toList();
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: fileList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10.0),
      //itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //value: images[i],
        //child: images.length == 0  ? Text('Add some images'): ImageItem(),
      //),
      itemBuilder: (ctx, i) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(blurRadius: 20),
            ],
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
          height: 250,
          child:  Image.file(
            fileList[i],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
