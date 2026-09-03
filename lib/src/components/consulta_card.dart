import 'package:flutter/material.dart';

import '../models/models.dart';
import '../styles/styles.dart';

class ConsultaCard extends StatelessWidget {
 const ConsultaCard({
 super.key,
 required this.consulta,
 required this.onConfirmar,
 required this.onCancelar,
 });

 final Consulta consulta;
 final VoidCallback onConfirmar;
 final VoidCallback onCancelar;

 @override
 Widget build(BuildContext context) {
 return Container(
 width: double.infinity,
 padding: ConsultaCardStyles.paddingCard,
 decoration: ConsultaCardStyles.card,
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 _BadgeStatus(status: consulta.status),
 const SizedBox(height: 20),
 _Secao(
 titulo: 'Paciente',
 children: [
 Text(consulta.paciente.nome, style: ConsultaCardStyles.valor),
 const SizedBox(height: 4),
 Text(consulta.paciente.cpf, style: ConsultaCardStyles.info),
 Text(consulta.paciente.email, style: ConsultaCardStyles.info),
 ],
 ),
 _Secao(
 titulo: 'Médico',
 children: [
 Text(consulta.medico.nome, style: ConsultaCardStyles.valor),
 const SizedBox(height: 4),
 Text(consulta.medico.crm, style: ConsultaCardStyles.info),
 Text(
 consulta.medico.especialidade.nome,
 style: ConsultaCardStyles.info,
 ),
 ],
 ),
 _Secao(
 titulo: 'Consulta',
 ultima: consulta.status != StatusConsulta.agendada,
 children: [
 Text(
 formatarData(consulta.data),
 style: ConsultaCardStyles.valor,
 ),
 const SizedBox(height: 4),
 Text(
 formatarValor(consulta.valor),
 style: ConsultaCardStyles.info,
 ),
 if (consulta.observacoes != null &&
 consulta.observacoes!.isNotEmpty) ...[
 const SizedBox(height: 8),
 Text(
 consulta.observacoes!,
 style: ConsultaCardStyles.observacoes,
 ),
 ],
 ],
 ),
 if (consulta.status == StatusConsulta.agendada)
 _BotoesAcao(onConfirmar: onConfirmar, onCancelar: onCancelar)
 else
 _MensagemStatus(status: consulta.status),
 ],
 ),
 );
 }
}

class _BadgeStatus extends StatelessWidget {
 const _BadgeStatus({required this.status});

 final StatusConsulta status;

 @override
 Widget build(BuildContext context) {
 return Container(
 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
 decoration: ConsultaCardStyles.badge(status),
 child: Text(status.rotulo, style: ConsultaCardStyles.statusTexto),
 );
 }
}

class _Secao extends StatelessWidget {
 const _Secao({
 required this.titulo,
 required this.children,
 this.ultima = false,
 });

 final String titulo;
 final List<Widget> children;
 final bool ultima;

 @override
 Widget build(BuildContext context) {
 return Container(
 width: double.infinity,
 margin: const EdgeInsets.only(bottom: 20),
 padding: const EdgeInsets.only(bottom: 20),
 decoration: ultima ? null : ConsultaCardStyles.secao,
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Text(titulo, style: ConsultaCardStyles.label),
 const SizedBox(height: 8),
 ...children,
 ],
 ),
 );
 }
}

class _BotoesAcao extends StatelessWidget {
 const _BotoesAcao({required this.onConfirmar, required this.onCancelar});

 final VoidCallback onConfirmar;
 final VoidCallback onCancelar;

 @override
 Widget build(BuildContext context) {
 return Column(
 crossAxisAlignment: CrossAxisAlignment.stretch,
 children: [
 ElevatedButton(
 onPressed: onConfirmar,
 style: ElevatedButton.styleFrom(
 backgroundColor: AppColors.sucesso,
 foregroundColor: AppColors.branco,
 padding: const EdgeInsets.symmetric(vertical: 14),
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(8),
 ),
 ),
 child: const Text('Confirmar', style: ConsultaCardStyles.botaoTexto),
 ),
 const SizedBox(height: 12),
 ElevatedButton(
 onPressed: onCancelar,
 style: ElevatedButton.styleFrom(
 backgroundColor: AppColors.perigo,
 foregroundColor: AppColors.branco,
 padding: const EdgeInsets.symmetric(vertical: 14),
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(8),
 ),
 ),
 child: const Text('Cancelar', style: ConsultaCardStyles.botaoTexto),
 ),
 ],
 );
 }
}

class _MensagemStatus extends StatelessWidget {
 const _MensagemStatus({required this.status});

 final StatusConsulta status;

 @override
 Widget build(BuildContext context) {
 final confirmada = status == StatusConsulta.confirmada;
 return Container(
 width: double.infinity,
 padding: const EdgeInsets.all(16),
 decoration: ConsultaCardStyles.mensagem(status),
 child: Text(
 confirmada ? 'Consulta confirmada com sucesso!' : 'Consulta cancelada',
 textAlign: TextAlign.center,
 style: ConsultaCardStyles.mensagemTexto,
 ),
 );
 }
}

String formatarData(DateTime data) {
 final dia = data.day.toString().padLeft(2, '0');
 final mes = data.month.toString().padLeft(2, '0');
 final hora = data.hour.toString().padLeft(2, '0');
 final minuto = data.minute.toString().padLeft(2, '0');
 return '$dia/$mes/${data.year} às $hora:$minuto';
}

String formatarValor(double valor) {
 return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
}
