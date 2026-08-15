import 'package:flutter/material.dart';
import 'src/screens/screens.dart';
import 'src/styles/app_colors.dart';

void main() {
 runApp(const MarcacaoConsultasApp());
}

class MarcacaoConsultasApp extends StatelessWidget {
 const MarcacaoConsultasApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false,
 title: 'Sistema de Consultas',
 theme: ThemeData(
 colorScheme: ColorScheme.fromSeed(
 seedColor: AppColors.primaria,
 ),
 useMaterial3: true,
 ),
 home: const HomeScreen(),
 );
 }
}
