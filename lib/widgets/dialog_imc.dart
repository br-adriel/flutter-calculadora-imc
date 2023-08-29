import 'package:calculadora_imc/utils/imc.dart';
import 'package:flutter/material.dart';

class DialogIMC extends StatelessWidget {
  final double imc;

  const DialogIMC(this.imc, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Imc.getStatus(imc)),
      content: Text("Seu IMC é ${imc.toStringAsFixed(1)}"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Fechar"),
        )
      ],
    );
  }
}
