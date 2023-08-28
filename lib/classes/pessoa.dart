class Pessoa {
  double _altura = 0.0;
  String _nome = "";
  double _peso = 0.0;

  Pessoa(String nome, double altura, double peso) {
    _altura = altura;
    _nome = nome;
    _peso = peso;
  }

  double get imc {
    return _peso / (_altura * _altura);
  }

  double get altura {
    return _altura;
  }

  set altura(double novaAltura) {
    if (novaAltura > 0) {
      _altura = novaAltura;
    }
  }

  String get nome {
    return _nome;
  }

  set nome(String novoNome) {
    novoNome = novoNome.trim();
    if (novoNome.isNotEmpty) {
      _nome = novoNome;
    }
  }

  double get peso {
    return _peso;
  }

  set peso(double novoPeso) {
    if (novoPeso > 0) {
      _peso = novoPeso;
    }
  }
}
