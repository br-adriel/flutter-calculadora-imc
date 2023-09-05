import 'package:calculadora_imc/pages/home/form_imc.dart';
import 'package:calculadora_imc/pages/home/history.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _paginaAtual = 0;
  String _titulo = "Calculadora de IMC";
  final PageController _pageController = PageController(initialPage: 0);
  final Map<int, String> _titulos = {
    0: "Calculadora de IMC",
    1: "Histórico",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _paginaAtual = value;
                  _titulo = _titulos[value] ?? "";
                });
              },
              children: const [
                FormImcPage(),
                HistoryPage(),
              ],
            ),
          ),
          BottomNavigationBar(
            currentIndex: _paginaAtual,
            onTap: (value) {
              setState(() {
                _titulo = _titulos[value] ?? "";
                _paginaAtual = value;
                _pageController.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: "Calcular IMC",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "Histórico",
              ),
            ],
          )
        ],
      ),
    );
  }
}
