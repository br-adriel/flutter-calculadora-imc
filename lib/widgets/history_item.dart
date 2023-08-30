import 'package:calculadora_imc/classes/pessoa.dart';
import 'package:calculadora_imc/utils/imc.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final Pessoa pessoa;

  const HistoryItem(this.pessoa, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Imc.getStatus(pessoa.imc),
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              pessoa.imc.toStringAsFixed(1),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 4),
              Text(pessoa.nome),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.balance),
              const SizedBox(width: 4),
              Text("${pessoa.peso.toStringAsFixed(1)} Kg"),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.height),
              const SizedBox(width: 4),
              Text("${pessoa.altura.toStringAsFixed(2)} m"),
            ],
          ),
        ],
      ),
    );
  }
}
