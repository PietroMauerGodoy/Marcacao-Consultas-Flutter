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

  factory Consulta.fromJson(Map<String, dynamic> json) {
    return Consulta(
      id: json['id'] as int,
      medico: Medico.fromJson(json['medico'] as Map<String, dynamic>),
      paciente: Paciente.fromJson(json['paciente'] as Map<String, dynamic>),
      data: DateTime.parse(json['data'] as String),
      valor: (json['valor'] as num).toDouble(),
      status: StatusConsulta.values.byName(json['status'] as String),
      observacoes: json['observacoes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medico': medico.toJson(),
      'paciente': paciente.toJson(),
      'data': data.toIso8601String(),
      'valor': valor,
      'status': status.name,
      'observacoes': observacoes,
    };
  }
}
