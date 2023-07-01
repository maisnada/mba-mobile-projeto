import 'package:flutter/material.dart';

class Doacao {
  String? id;
  String? nomeAlimento;
  bool isRetirado;

  Doacao(
      {required this.id, required this.nomeAlimento, required this.isRetirado});

  static List<Doacao> listaDoacoes() {
    return [
      Doacao(id: 'id', nomeAlimento: 'Arroz', isRetirado: false),
      Doacao(id: 'id', nomeAlimento: 'Bolo', isRetirado: true),
      Doacao(id: 'id', nomeAlimento: 'Cenoura', isRetirado: true),
      Doacao(id: 'id', nomeAlimento: 'Cebola', isRetirado: false)
    ];
  }
}
