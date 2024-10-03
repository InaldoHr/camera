import 'dart:io';

import 'package:camera/controller/home_controller.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();
  File? _imagem;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Top 10 camêras of the world'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            if (_imagem == null) ... [
              const Text(
                'Imagem não selecionada',
                style: TextStyle(fontSize: 20),
              ),
            ] else ... [
              
              Image.file(
                _imagem!,
                width: 350,
                height: 350,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
            ],

            ElevatedButton(
              onPressed: () async {
                final imagem = await controller.TirarFoto();
                setState(() {
                  _imagem = imagem;
                });
              },
              child: const Text('Tirar foto marota'),
            ),
            ElevatedButton(
              onPressed: controller.Salvar,
              child: Text('Salvar Imagem'),
            )
          ],
        ),
      ),
    );
  }
}

