import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dio dio = Dio();
  String data = '';

  void deleteData() async {
    try {
      Response response = await dio.delete('https://api.example.com/endpoint/1'); // Deletando o recurso com ID 1
      setState(() {
        data = 'Recurso deletado'; // Atualiza o estado informando que o recurso foi deletado
      });
    } catch (e) {
      print('Erro ao fazer DELETE: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DELETE Request Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: deleteData, // Chama o método DELETE ao clicar no botão
              child: Text('Deletar Recurso via DELETE'),
            ),
            SizedBox(height: 20),
            data.isEmpty ? Text('Nenhum dado deletado') : Text(data),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
