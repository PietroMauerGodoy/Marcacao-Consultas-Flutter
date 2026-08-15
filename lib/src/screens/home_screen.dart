import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 backgroundColor: AppColors.primaria,
 body: SafeArea(
 child: Center(
 child: Padding(
 padding: const EdgeInsets.all(24),
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
 children: const [
 Text(
 'Sistema de Consultas',
 textAlign: TextAlign.center,
 style: TextStyle(
 color: AppColors.branco,
 fontSize: 28,
 fontWeight: FontWeight.bold,
 ),
 ),
 SizedBox(height: 12),
 Text(
 'Estrutura Flutter inicial pronta',
 textAlign: TextAlign.center,
 style: TextStyle(
 color: AppColors.branco,
 fontSize: 18,
 ),
 ),
 SizedBox(height: 24),
 Text(
 'Na próxima aula: ConsultaCard, estado e ações',
 textAlign: TextAlign.center,
 style: TextStyle(
 color: AppColors.branco,
 fontSize: 14,
 ),
 ),
 ],
 ),
 ),
 ),
 ),
 );
 }
}
