import 'dart:io';

import 'package:camera/model/camera_model.dart';


class HomeController {
  final CameraModel model = CameraModel();
  
  
  

  

  Future<File?> TirarFoto() async {
    await model.TirarFoto();
    return model.imagem;
   
  }

  Future<void> Salvar() async {
    await model.Salvar();
    print('imagem copiada para ${model.imagem!.path}');
  }

  
}

