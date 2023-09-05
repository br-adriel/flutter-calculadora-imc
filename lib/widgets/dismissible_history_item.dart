import 'package:calculadora_imc/models/Imc.dart';
import 'package:calculadora_imc/widgets/history_item.dart';
import 'package:flutter/material.dart';

class DismissibleHistoryItem extends StatelessWidget {
  final IMCModel imc;
  final Future<bool> Function(DismissDirection)? confirmDismiss;
  final DismissDirection? direction;
  final void Function(DismissDirection)? onDismissed;

  const DismissibleHistoryItem(this.imc,
      {super.key, this.confirmDismiss, this.direction, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: direction ?? DismissDirection.endToStart,
      confirmDismiss: confirmDismiss,
      background: Container(
        color: Colors.red[500],
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.delete_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onDismissed: onDismissed,
      key: Key(imc.id.toString()),
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: HistoryItem(imc),
      ),
    );
  }
}
