class IMCModel {
  late final int _id;
  String nome = "";
  double altura = 0;
  double peso = 0;

  IMCModel(this._id, this.altura, this.nome, this.peso);

  int get id => _id;

  double get value => peso / (altura * altura);
}
