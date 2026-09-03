import 'medico.dart';
import 'paciente.dart';
import 'status_consulta.dart';

class Consulta {
 final int id;
 final Medico medico;
 final Paciente paciente;
 final DateTime data;
 final double valor;
 final StatusConsulta status;
 final String? observacoes;

 const Consulta({
 required this.id,
 required this.medico,
 required this.paciente,
 required this.data,
 required this.valor,
 required this.status,
 this.observacoes,
 });

 Consulta copyWith({
 int? id,
 Medico? medico,
 Paciente? paciente,
 DateTime? data,
 double? valor,
 StatusConsulta? status,
 String? observacoes,
 }) {
 return Consulta(
 id: id ?? this.id,
 medico: medico ?? this.medico,
 paciente: paciente ?? this.paciente,
 data: data ?? this.data,
 valor: valor ?? this.valor,
 status: status ?? this.status,
 observacoes: observacoes ?? this.observacoes,
 );
 }
}
