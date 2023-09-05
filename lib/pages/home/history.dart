import 'package:calculadora_imc/models/Imc.dart';
import 'package:calculadora_imc/repositories/imc_repository.dart';
import 'package:calculadora_imc/widgets/dialog_clear_history.dart';
import 'package:calculadora_imc/widgets/dismissible_history_item.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final IMCRepository _imcRepository = IMCRepository();
  List<IMCModel> _imcs = [];

  Future<void> _carregarImcs() async {
    _imcs = await _imcRepository.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _carregarImcs();
  }

  @override
  Widget build(BuildContext context) {
    if (_imcs.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text("Nenhum IMC foi calculado ainda")),
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        IMCModel imc = _imcs[index];
        return DismissibleHistoryItem(
          imc,
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext bc) {
                return const DialogClearHistory();
              },
            );
          },
          onDismissed: (direction) async {
            await _imcRepository.deleteOne(imc.id);
            _carregarImcs();
          },
        );
      },
      itemCount: _imcs.length,
    );
  }
}
