import 'package:calculadora_imc/repositories/pessoa_repository.dart';
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
    return const Placeholder();
  }
}
