import 'package:flutter/material.dart';

import '../models/status_consulta.dart';
import 'app_colors.dart';

class ConsultaCardStyles {
 static const EdgeInsets paddingCard = EdgeInsets.all(20);

 static const TextStyle statusTexto = TextStyle(
 color: AppColors.branco,
 fontWeight: FontWeight.bold,
 fontSize: 12,
 );

 static const TextStyle label = TextStyle(
 fontSize: 16,
 fontWeight: FontWeight.bold,
 color: AppColors.primaria,
 );

 static const TextStyle valor = TextStyle(
 fontSize: 18,
 color: AppColors.textoEscuro,
 );

 static const TextStyle info = TextStyle(
 fontSize: 14,
 color: AppColors.textoSecundario,
 );

 static const TextStyle observacoes = TextStyle(
 fontSize: 14,
 color: AppColors.textoMuted,
 fontStyle: FontStyle.italic,
 );

 static const TextStyle mensagemTexto = TextStyle(
 fontSize: 16,
 color: AppColors.textoEscuro,
 fontWeight: FontWeight.w600,
 );

 static const TextStyle botaoTexto = TextStyle(
 color: AppColors.branco,
 fontWeight: FontWeight.bold,
 fontSize: 14,
 );

 static const TextStyle botaoDetalhesTexto = TextStyle(
 color: AppColors.primaria,
 fontWeight: FontWeight.bold,
 fontSize: 14,
 );

 static BoxDecoration get card => BoxDecoration(
 color: AppColors.branco,
 borderRadius: BorderRadius.circular(16),
 boxShadow: const [
 BoxShadow(color: Color(0x33000000), blurRadius: 8, offset: Offset(0, 4)),
 ],
 );

 static BoxDecoration badge(StatusConsulta status) {
 return BoxDecoration(
 color: corBadge(status),
 borderRadius: BorderRadius.circular(20),
 );
 }

 static BoxDecoration get secao => const BoxDecoration(
 border: Border(bottom: BorderSide(color: AppColors.bordaSecao)),
 );

 static BoxDecoration mensagem(StatusConsulta status) {
 final confirmada = status == StatusConsulta.confirmada;
 return BoxDecoration(
 color: confirmada
 ? AppColors.fundoMensagemSucesso
 : AppColors.fundoMensagemErro,
 borderRadius: BorderRadius.circular(8),
 border: Border(
 left: BorderSide(
 color: confirmada ? AppColors.sucesso : AppColors.perigo,
 width: 4,
 ),
 ),
 );
 }

 static Color corBadge(StatusConsulta status) {
 return switch (status) {
 StatusConsulta.agendada => AppColors.alerta,
 StatusConsulta.confirmada => AppColors.sucesso,
 StatusConsulta.cancelada => AppColors.perigo,
 };
 }
}
