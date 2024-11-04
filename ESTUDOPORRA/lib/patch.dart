import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dio dio = Dio();
  String data = '';

  void patchData() async {
    try {
      Response response = await dio.patch(
        'https://api.example.com/endpoint/1', // Suponha que estamos atualizando o recurso com ID 1
        data: {
          'age': 31, // Apenas atualiza a idade
        },
      );
      setState(() {
        data = response.data.toString(); // Atualiza o estado com a resposta da API
      });
    } catch (e) {
      print('Erro ao fazer PATCH: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PATCH Request Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: patchData, // Chama o método PATCH ao clicar no botão
              child: Text('Atualizar Parcialmente via PATCH'),
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
