import 'package:flutter/material.dart';

class DialogClearHistory extends StatelessWidget {
  const DialogClearHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Remover IMC do histórico?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text("Remover"),
        )
      ],
    );
  }
}
