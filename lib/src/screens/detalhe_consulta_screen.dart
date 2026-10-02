import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../styles/app_colors.dart';

class DetalheConsultaScreen extends StatelessWidget {
  const DetalheConsultaScreen({super.key, required this.consulta});

  final Consulta consulta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaria,
      appBar: AppBar(
        backgroundColor: AppColors.primaria,
        foregroundColor: AppColors.branco,
        elevation: 0,
        title: const Text('Detalhes da consulta'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConsultaCard(consulta: consulta),
        ),
      ),
    );
  }
}
