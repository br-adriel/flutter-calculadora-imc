import 'package:calculadora_imc/classes/pessoa.dart';

class PessoaRepository {
  List<Pessoa> _pessoas = [];

  get pessoas {
    return _pessoas;
  }

  void addPessoa(Pessoa p) {
    _pessoas.add(p);
  }

  void removePessoa(String id) {
    _pessoas = _pessoas.where((pessoa) => pessoa.id != id).toList();
  }
}