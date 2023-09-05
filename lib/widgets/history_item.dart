import 'package:calculadora_imc/models/Imc.dart';
import 'package:calculadora_imc/utils/imc.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final IMCModel imc;

  const HistoryItem(this.imc, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Imc.getStatus(imc.value),
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              imc.value.toStringAsFixed(1),
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
              Text(imc.nome),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.balance),
              const SizedBox(width: 4),
              Text("${imc.peso.toStringAsFixed(1)} Kg"),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.height),
              const SizedBox(width: 4),
              Text("${imc.altura.toStringAsFixed(2)} m"),
            ],
          ),
        ],
      ),
    );
  }
}
