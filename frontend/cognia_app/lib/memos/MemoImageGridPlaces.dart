import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';


class MemoImageGridPlaces extends StatefulWidget {
  static const routeName = '/memoimagegridplaces';

  @override
  _MemoImageGridPlacesState createState() => _MemoImageGridPlacesState();
}

class _MemoImageGridPlacesState extends State<MemoImageGridPlaces> {
  // New Image
  File _takenImage;
  int counter = 0;

  // Generate the list
  List<FileSystemEntity> fileList = [];


  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) {
      return;
    }

    //Get date and time to use as file name
    //DateTime ketF = new DateTime.now();
    //String baru = "${ketF.year}${ketF.month}${ketF.day}";

    // For the image list
    //final appDir = await pPath.getApplicationDocumentsDirectory();
    //final fileName = path.basename(imageFile.path);
    //final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    // To save in external directory
    img.Image decodedImage = img.decodeImage(imageFile.readAsBytesSync());
    img.Image copiedDecodedImage = img.copyResize(decodedImage, height: 700);

    //Random number for file naming
    int rand = new Random().nextInt(100000);


    final directory ='/storage/emulated/0/Android/data/cogniaapp.cognia_app/files/MyPlaces/';
    final myImgDir = await new Directory(directory).create();
    var listOfFiles = await myImgDir.list(recursive: true).toList();
    var count = listOfFiles.length;
    counter = count + 1;

    var kompresimg = new File("$directory/image_$counter$rand.jpg").writeAsBytesSync(img.encodeJpg(copiedDecodedImage, quality: 95));

    //var _imageToStore = Picture(picName: savedImage);
    //_storeImage() {
    //Provider.of<Pictures>(context, listen: false).storeImage(_imageToStore);
    //}
    //_storeImage();
    _generateImageList();
    setState(() {
      _takenImage = imageFile;
    });
  }


  Future<void> _generateImageList() async{
    final directory = '/storage/emulated/0/Android/data/cogniaapp.cognia_app/files/MyPlaces/';
    final myImgDir = await new Directory(directory).create();

    fileList = await myImgDir.list(recursive: true).toList();
    setState((){});
  }

  Future<void> _openImage(context, fileName) async {
    showDialog(
      context: context,
      builder: (a) => AlertDialog(
        title: Text("Captions: to be added soon!"),
        content: Image.file(
          fileName,
          fit: BoxFit.cover,
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                _dismissDialog(context);
              },
              child: Text('Close'))
        ],
      ),
    );
  }

  _dismissDialog(context) {
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    _generateImageList();
    return Scaffold(
      appBar: AppBar(
        title: Text('MY PLACES', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lightGreen[500],
        centerTitle: true,
      ),
      body: Container(
        //child: ImagesGrid(),
        child:
        GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: fileList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10.0),
          //itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          //value: images[i],
          //child: images.length == 0  ? Text('Add some images'): ImageItem(),
          //),
          itemBuilder: (ctx, i) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                height: 250,
                child:  Image.file(
                  fileList[i],
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                _openImage(context, fileList[i]);
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple[500],
      ),
    );
  }
}
