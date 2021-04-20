import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_dialog.dart';

class ImagePickerHandler {
  ImagePickerDialog imagePicker;
  AnimationController _controller;
  ImagePickerListener _listener;

  ImagePickerHandler(this._listener, this._controller);

  openCamera() async {
    imagePicker.dismissDialog();
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
//    _listener.userImage(image);
    cropImage(image);
  }

  openGallery() async {
    imagePicker.dismissDialog();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    cropImage(image);
  }

  void init() {
    imagePicker = new ImagePickerDialog(this, _controller);
    imagePicker.initState();
  }

  Future cropImage(File image) async {
//    File croppedFile = await ImageCropper.cropImage(
//      sourcePath: image.path,
//      ratioX: 1.0,
//      ratioY: 1.0,
//      maxWidth: 512,
//      maxHeight: 512,
//    );
    final sampleFile = await ImageCrop.sampleImage(
      file: image,
      preferredWidth: 512,
      preferredHeight: 512,
    );
    _listener.userImage(sampleFile);
  }

  showDialog(BuildContext context) {
    imagePicker.getImage(context);
  }
}

abstract class ImagePickerListener {
  userImage(File _image);
}
