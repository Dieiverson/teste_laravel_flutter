import 'dart:async';

import 'package:app/model/Mug.dart';
import 'package:app/util/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canecas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Canecas'),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _mugs = 0;

  @override
  void initState() {
    super.initState();
    Utils.showLoadingProgress(context);
    Mug.getQuantity()
        .then((value) => {
              setState(() {
                _mugs = value;
                Utils.dismissLoadingProgress(context);
              })
            })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 15),
        content: Text(
            "Ocorreu um erro ao tentar realizar a conexão com o servidor. Verifique na classe 'Mug' se o IP está setado corretamente.\nDetalhes: $error"),
      ));
      Utils.dismissLoadingProgress(context);
    });
    intervalCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_mugs',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
            ),
            const Text(
              'Canecas',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: addMug, child: const Text("Adicionar caneca")),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: removeMug,
                      child: const Text("Remover caneca")),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Text(
                'Feito por Dieiverson',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  intervalCheck() {
    debugPrint("Iniciou a atualização automática");
    Timer.periodic(const Duration(seconds: 30), (timer) {
      Mug.getQuantity().then((value) {
        if (_mugs != value) {
          setState(() {
            _mugs = value;
          });
        }
      });
    });
  }

  addMug() {
    Utils.showLoadingProgress(context);
    Mug.add().then((value) {
      setState(() {
        _mugs = value;
      });
      Utils.dismissLoadingProgress(context);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 8),
        content: Text(
            "Ocorreu um erro ao tentar realizar a conexão com o servidor.\nDetalhes: $error"),
      ));
      Utils.dismissLoadingProgress(context);
    });
  }

  removeMug() {
    Utils.showLoadingProgress(context);
    Mug.remove().then((value) {
      setState(() {
        _mugs = value;
        Utils.dismissLoadingProgress(context);
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 8),
        content: Text(
            "Ocorreu um erro ao tentar realizar a conexão com o servidor.\nDetalhes: $error"),
      ));
      Utils.dismissLoadingProgress(
          context);
    });
  }
}
