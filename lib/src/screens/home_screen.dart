import 'package:flutter/material.dart';

import '../components/components.dart';
import '../data/data.dart';
import '../models/models.dart';
import '../styles/app_colors.dart';
import 'detalhe_consulta_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Consulta> _consultas = [];
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    _carregarConsultas();
  }

  Future<void> _carregarConsultas() async {
    final consultas = await ConsultaStorage.carregar();
    if (!mounted) return;

    setState(() {
      _consultas = consultas;
      _carregando = false;
    });
  }

  Future<void> _confirmarConsulta(int id) async {
    await _atualizarStatus(id, StatusConsulta.confirmada);
  }

  Future<void> _cancelarConsulta(int id) async {
    await _atualizarStatus(id, StatusConsulta.cancelada);
  }

  Future<void> _atualizarStatus(int id, StatusConsulta status) async {
    final consultasAtualizadas = _consultas
        .map(
          (consulta) =>
              consulta.id == id ? consulta.copyWith(status: status) : consulta,
        )
        .toList();

    setState(() {
      _consultas = consultasAtualizadas;
    });
    await ConsultaStorage.salvar(consultasAtualizadas);
  }

  void _abrirDetalhes(int id) {
    final consulta = _consultas.firstWhere((item) => item.id == id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetalheConsultaScreen(consulta: consulta),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaria,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                children: [
                  Text(
                    'Sistema de Consultas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.branco,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Acompanhe o status da sua consulta',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.branco, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _carregando
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColors.branco),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      itemCount: _consultas.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final consulta = _consultas[index];
                        return ConsultaCard(
                          key: ValueKey(consulta.id),
                          consulta: consulta,
                          onConfirmar: _confirmarConsulta,
                          onCancelar: _cancelarConsulta,
                          onVerDetalhes: _abrirDetalhes,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
