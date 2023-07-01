import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:proj_bootcamp_2/models/doacao.dart';

class DoacaoItem extends StatelessWidget {
  const DoacaoItem({super.key, required this.doacao});

  final Doacao doacao;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Color.fromARGB(255, 219, 217, 217),
        title: Text(
          doacao.nomeAlimento!,
          style: TextStyle(
              fontSize: 16,
              decoration:
                  doacao.isRetirado ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Color.fromARGB(172, 216, 63, 52),
              borderRadius: BorderRadius.circular(4)),
          child: IconButton(
            color: Colors.white,
            iconSize: 16,
            icon: Icon(Icons.delete),
            onPressed: () => {},
          ),
        ),
      ),
    );
  }
}
