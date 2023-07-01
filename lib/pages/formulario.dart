import 'package:flutter/material.dart';

import '../constantes/cores.dart';
import '../main.dart';
import '../services/doacao_service.dart';
import 'home.dart';
import 'login.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final TextEditingController _alimento = TextEditingController();
  final TextEditingController _tipo = TextEditingController();
  TextEditingController _data = TextEditingController();

  TextEditingController intialdateval = TextEditingController();

  final _doacaoService = DoacaoService();

  void _cadastrar() {
    if (!_alimento.value.toString().trim().isEmpty &&
        !_tipo.toString().trim().isEmpty &&
        !_data.toString().trim().isEmpty) {
      _doacaoService
          .adicionar(_alimento.value.toString(), _tipo.value.toString(),
              _data.value.toString())
          .then((retorno) => {
                if (retorno == null)
                  {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()))
                  }
                else
                  {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    )
                  }
              });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro ao cadastrar doacao, tente mais tarde!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirme seus dados'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    }
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025));
    if (picked != null)
      setState(() => {
            _data = picked.toString() as TextEditingController,
            intialdateval.text = picked.toString()
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cadastro"), backgroundColor: verde),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                decoration: const InputDecoration(labelText: 'Alimento'),
                controller: _alimento,
              ),
              TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                decoration: const InputDecoration(labelText: 'Tipo'),
                controller: _tipo,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                autocorrect: false,
                controller: intialdateval,
                onSaved: (value) {
                  _data = value as TextEditingController;
                },
                onTap: () {
                  _selectDate();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                maxLines: 1,
                validator: (value) {
                  if (_data.value.toString().trim().isEmpty) {
                    return 'Escolha data';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Data de preparo',
                  //filled: true,
                  icon: const Icon(Icons.calendar_today),
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                child: ElevatedButton(
                  onPressed: _cadastrar,
                  child: Text("Cadastrar"),
                  style: TextButton.styleFrom(
                    backgroundColor: verde,
                    padding: EdgeInsets.all(15),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
