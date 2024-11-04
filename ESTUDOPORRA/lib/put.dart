import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dio dio = Dio();
  String data = '';

  void putData() async {
    try {
      Response response = await dio.put(
        'https://api.example.com/endpoint/1', // Suponha que estamos atualizando o recurso com ID 1
        data: {
          'name': 'John Doe',
          'age': 30,
        },
      );
      setState(() {
        data = response.data.toString(); // Atualiza o estado com a resposta da API
      });
    } catch (e) {
      print('Erro ao fazer PUT: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PUT Request Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: putData, // Chama o método PUT ao clicar no botão
              child: Text('Atualizar Dados via PUT'),
            ),
            SizedBox(height: 20),
            data.isEmpty ? Text('Nenhum dado atualizado') : Text(data),
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
