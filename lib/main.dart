import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proj_bootcamp_2/constantes/cores.dart';
import 'package:proj_bootcamp_2/models/doacao.dart';
import 'package:proj_bootcamp_2/components/doacao_item.dart';
import 'package:proj_bootcamp_2/pages/formulario.dart';
import 'package:proj_bootcamp_2/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
