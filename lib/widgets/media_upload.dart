import 'package:flutter/material.dart';
import 'package:circles/widgets/image_picker.dart';
import 'dart:async';
import 'dart:io';

class MediaUpload extends StatefulWidget {
  @override
  _MediaUploadState createState() => _MediaUploadState();
}

class _MediaUploadState extends State<MediaUpload> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Center(
        child: _image == null ? Text('No Attatchments') : Image.file(_image),
      ),
      RaisedButton(
        onPressed: getImage,
        child: Container(
          child: Text('upload'),
        ),
      )
    ]);
  }
}
