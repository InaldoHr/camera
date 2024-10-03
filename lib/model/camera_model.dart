import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class CameraModel {
  File? imagem;


  Future<File?> TirarFoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return null;
      final imageTemp = File(image.path);
      imagem = imageTemp;
      return imagem;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  
  Future<void> Salvar() async {
  try {
    if (imagem == null) return;
    final directory = await getExternalStorageDirectory();
    final file = File('${directory!.path}/captured_image.jpg');
    await imagem!.copy(file.path);
  } on PlatformException catch (e) {
    print('Failed to save image: $e');
  }
}
}
