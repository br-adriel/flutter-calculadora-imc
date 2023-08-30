import 'package:calculadora_imc/classes/pessoa.dart';
import 'package:calculadora_imc/repositories/pessoa_repository.dart';
import 'package:calculadora_imc/utils/imc.dart';
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
        return Dismissible(
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext bc) {
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
              },
            );
          },
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
          onDismissed: (direction) {
            widget.pessoaRepository.removePessoa(pessoa.id);
            setState(() {});
          },
          key: Key(pessoa.id),
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
            child: ListTile(
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
            ),
          ),
        );
      },
      itemCount: widget.pessoaRepository.pessoas.length,
    );
  }
}
