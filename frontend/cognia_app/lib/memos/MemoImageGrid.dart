import 'package:flutter/material.dart';
import '../widgets/images_grid.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;
import 'package:provider/provider.dart';
import '../models/picture.dart';
import '../providers/pictures.dart';

class MemoImageGrid extends StatefulWidget {
  static const routeName = '/memoimagegrid';

  @override
  _MemoImageGridState createState() => _MemoImageGridState();
}

class _MemoImageGridState extends State<MemoImageGrid> {
  File _takenImage;
  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _takenImage = imageFile;
    });
    final appDir = await pPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    var _imageToStore = Picture(picName: savedImage);
    _storeImage() {
      Provider.of<Pictures>(context, listen: false).storeImage(_imageToStore);
    }
    _storeImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY PEOPLE', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple[500],
        centerTitle: true,
      ),
      body: Container(
        child: ImagesGrid(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple[500],
      ),
    );
  }
}
