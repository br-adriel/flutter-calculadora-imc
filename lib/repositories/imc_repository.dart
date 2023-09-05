import 'package:calculadora_imc/database/sqlite.dart';
import 'package:calculadora_imc/models/Imc.dart';
import 'package:sqflite/sqflite.dart';

class IMCRepository {
  Future<List<IMCModel>> getData() async {
    List<IMCModel> imcs = [];
    Database db = await SQLiteDatabase().obterBancoDeDados();

    String query = '''
                    SELECT id, nome, altura, peso
                    FROM imc
                    ORDER BY id DESC;
                  ''';

    var result = await db.rawQuery(query);
    imcs = result
        .map((e) => IMCModel(
              int.parse(e['id'].toString()),
              double.parse(e['altura'].toString()),
              e['nome'].toString(),
              double.parse(e['peso'].toString()),
            ))
        .toList();
    return imcs;
  }

  Future<void> saveOne(IMCModel imcModel) async {
    Database db = await SQLiteDatabase().obterBancoDeDados();
    db.rawInsert("INSERT INTO imc (nome, altura, peso) VALUES (?, ?, ?)",
        [imcModel.nome, imcModel.altura, imcModel.peso]);
  }

  Future<void> updateOne(IMCModel imcModel) async {
    Database db = await SQLiteDatabase().obterBancoDeDados();
    db.rawUpdate(
      "UPDATE imc SET nome = ?, altura = ?, peso = ? WHERE id = ?",
      [imcModel.nome, imcModel.altura, imcModel.peso, imcModel.id],
    );
  }

  Future<void> deleteOne(int id) async {
    Database db = await SQLiteDatabase().obterBancoDeDados();
    db.rawDelete(
      "DELETE FROM imc WHERE id = ?",
      [id],
    );
  }
}
