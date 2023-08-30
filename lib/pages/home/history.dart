import 'package:calculadora_imc/classes/pessoa.dart';
import 'package:calculadora_imc/repositories/pessoa_repository.dart';
import 'package:calculadora_imc/widgets/dialog_clear_history.dart';
import 'package:calculadora_imc/widgets/dismissible_history_item.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final PessoaRepository pessoaRepository;

  const HistoryPage(this.pessoaRepository, {super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.pessoaRepository.pessoas.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text("Nenhum IMC foi calculado ainda")),
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Pessoa pessoa = widget.pessoaRepository.pessoas[index];
        return DismissibleHistoryItem(
          pessoa,
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext bc) {
                return const DialogClearHistory();
              },
            );
          },
          onDismissed: (direction) {
            widget.pessoaRepository.removePessoa(pessoa.id);
            setState(() {});
          },
        );
      },
      itemCount: widget.pessoaRepository.pessoas.length,
    );
  }
}
