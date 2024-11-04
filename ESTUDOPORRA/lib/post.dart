import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dio dio = Dio();
  String data = '';

  void postData() async {
    try {
      Response response = await dio.post(
        'https://api.example.com/endpoint',
        data: {
          'name': 'John Doe',
          'age': 25,
        },
      );
      setState(() {
        data = response.data.toString(); // Atualiza o estado com a resposta da API
      });
    } catch (e) {
      print('Erro ao fazer POST: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST Request Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: postData, // Chama o método POST ao clicar no botão
              child: Text('Enviar Dados via POST'),
            ),
            SizedBox(height: 20),
            data.isEmpty ? Text('Nenhum dado enviado') : Text(data),
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