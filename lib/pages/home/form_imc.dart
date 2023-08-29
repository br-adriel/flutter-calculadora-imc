import 'package:calculadora_imc/classes/pessoa.dart';
import 'package:calculadora_imc/repositories/pessoa_repository.dart';
import 'package:flutter/material.dart';

class FormImcPage extends StatefulWidget {
  final PessoaRepository pessoaRepository;

  const FormImcPage(this.pessoaRepository, {super.key});

  @override
  State<FormImcPage> createState() => _FormImcPageState();
}

class _FormImcPageState extends State<FormImcPage> {
  double _altura = 1.5;
  double _peso = 0;
  final TextEditingController _alturaStringController =
      TextEditingController(text: "1.50");
  final TextEditingController _nomeController = TextEditingController(text: "");
  final TextEditingController _pesoStringController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Expanded(child: Container()),
        TextField(
          textInputAction: TextInputAction.next,
          controller: _nomeController,
          onSubmitted: (value) {
            if (mounted) {
              setState(() {
                _nomeController.text = value.trim();
              });
            }
          },
          decoration: const InputDecoration(
            labelText: "Nome",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          textInputAction: TextInputAction.next,
          controller: _pesoStringController,
          onSubmitted: (value) {
            double? novoValor = double.tryParse(value);
            if (novoValor == null) {
              _pesoStringController.text = "0";
              _peso = 0;
            } else if (novoValor < 0) {
              _pesoStringController.text = "0";
              _peso = 0;
            } else {
              _pesoStringController.text = novoValor.toStringAsFixed(1);
              _peso = double.parse(novoValor.toStringAsFixed(1));
            }
            if (mounted) {
              setState(() {});
            }
          },
          decoration: const InputDecoration(
            labelText: "Peso",
            hintText: "65.4",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            suffix: Text("Kg"),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(width: 1, color: Colors.black45),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Altura",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        controller: _alturaStringController,
                        onSubmitted: (value) {
                          double? novoValor = double.tryParse(value);
                          if (novoValor == null) {
                            _alturaStringController.text = "1.50";
                            _altura = 1.5;
                          } else if (novoValor < 0.2) {
                            _alturaStringController.text = "0.2";
                            _altura = 0.2;
                          } else if (novoValor > 2.7) {
                            _alturaStringController.text = "2.7";
                            _altura = 2.7;
                          } else {
                            _alturaStringController.text =
                                novoValor.toStringAsFixed(2);
                            _altura =
                                double.parse(novoValor.toStringAsFixed(2));
                          }
                          if (mounted) {
                            setState(() {});
                          }
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const Text(
                      "m",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Slider(
                value: _altura,
                onChanged: (value) {
                  if (mounted) {
                    setState(() {
                      String novoValorString = value.toStringAsFixed(2);
                      _altura = double.parse(novoValorString);
                      _alturaStringController.text = novoValorString;
                    });
                  }
                },
                max: 2.7,
                min: 0.2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            if (_nomeController.text.isEmpty) {
              return;
            }
            if (_pesoStringController.text.isEmpty) {
              return;
            }
            if (_alturaStringController.text.isEmpty) {
              return;
            }
            Pessoa p = Pessoa(_nomeController.text, _altura, _peso);
            showDialog(
              context: context,
              builder: (BuildContext bc) {
                return Dialog(
                  child: Text(p.imc.toString()),
                );
              },
            );
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
          child: const Text(
            "Calcular IMC",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
