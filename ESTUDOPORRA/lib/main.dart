import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dio dio = Dio();
  String data = '';

  void getData() async {
    try {
      Response response = await dio.get('https://api.example.com/endpoint');
      setState(() {
        data = response.data.toString(); // Atualiza o estado com a resposta da API
      });
    } catch (e) {
      print('Erro ao fazer GET: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Request Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: getData, // Chama o método GET ao clicar no botão
              child: Text('Fazer Requisição'),
            ),
            SizedBox(height: 20),
            data.isEmpty ? Text('Nenhum dado recebido') : Text(data),
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
