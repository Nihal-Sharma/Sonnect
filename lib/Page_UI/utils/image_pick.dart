import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

pickImage(ImageSource source) async {
  final ImagePicker _imagepicker = ImagePicker();
  XFile? file = await _imagepicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
  print("No image selected");
}
