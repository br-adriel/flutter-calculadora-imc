import 'package:calculadora_imc/classes/pessoa.dart';

class PessoaRepository {
  List<Pessoa> _pessoas = [];

  List<Pessoa> get pessoas {
    return _pessoas;
  }

  void addPessoa(Pessoa p) {
    _pessoas.insert(0, p);
  }

  void removePessoa(String id) {
    _pessoas = _pessoas.where((pessoa) => pessoa.id != id).toList();
  }
}
