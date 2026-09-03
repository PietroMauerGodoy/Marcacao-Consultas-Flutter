import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../styles/app_colors.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

 @override
 State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 static const _especialidade = Especialidade(
 id: 1,
 nome: 'Cardiologia',
 descricao: 'Cuidados com o coração',
 );

 static const _medico = Medico(
 id: 1,
 nome: 'Dr. Roberto Silva',
 crm: 'CRM12345',
 especialidade: _especialidade,
 ativo: true,
 );

 static const _paciente = Paciente(
 id: 1,
 nome: 'Carlos Andrade',
 cpf: '123.456.789-00',
 email: 'carlos@email.com',
 telefone: '(11) 98765-4321',
 );

 Consulta _consulta = Consulta(
 id: 1,
 medico: _medico,
 paciente: _paciente,
 data: DateTime(2026, 8, 21, 14, 30),
 valor: 350,
 status: StatusConsulta.agendada,
 observacoes: 'Consulta de rotina',
 );

 void _confirmarConsulta() {
 setState(() {
 _consulta = _consulta.copyWith(status: StatusConsulta.confirmada);
 });
 }

 void _cancelarConsulta() {
 setState(() {
 _consulta = _consulta.copyWith(status: StatusConsulta.cancelada);
 });
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 backgroundColor: AppColors.primaria,
 body: SafeArea(
 child: SingleChildScrollView(
 padding: const EdgeInsets.all(24),
 child: Column(
 children: [
 const Text(
 'Sistema de Consultas',
 textAlign: TextAlign.center,
 style: TextStyle(
 color: AppColors.branco,
 fontSize: 28,
 fontWeight: FontWeight.bold,
 ),
 ),
 const SizedBox(height: 8),
 const Text(
 'Acompanhe o status da sua consulta',
 textAlign: TextAlign.center,
 style: TextStyle(color: AppColors.branco, fontSize: 16),
 ),
 const SizedBox(height: 24),
 ConsultaCard(
 consulta: _consulta,
 onConfirmar: _confirmarConsulta,
 onCancelar: _cancelarConsulta,
 ),
 ],
 ),
 ),
 ),
 );
 }
}
