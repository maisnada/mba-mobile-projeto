import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proj_bootcamp_2/constantes/cores.dart';
import 'package:proj_bootcamp_2/models/doacao.dart';
import 'package:proj_bootcamp_2/components/doacao_item.dart';
import 'package:proj_bootcamp_2/pages/formulario.dart';
import 'package:proj_bootcamp_2/pages/login.dart';
/* 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
} */

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = "Home";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final lista = Doacao.listaDoacoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            caixaBusca(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 20),
                    child: Text('Doacoes',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400)),
                  ),
                  for (Doacao doacao in lista)
                    DoacaoItem(
                      doacao: doacao,
                    ),
                ],
              ),
            )
          ]),
        ));
  }

  Container caixaBusca() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 155, 211, 179),
          borderRadius: BorderRadius.circular(25)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
            prefixIconConstraints: BoxConstraints(maxHeight: 18, minWidth: 18),
            border: InputBorder.none),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: verde,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormularioPage()));
            },
            icon: const Icon(Icons.add)),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            child: Image.asset('assets/images/user.png'),
          ),
        )
      ]),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: const Icon(Icons.logout))
      ],
    );
  }
}
