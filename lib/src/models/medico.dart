import 'especialidade.dart';

class Medico {
  final int id;
  final String nome;
  final String crm;
  final Especialidade especialidade;
  final bool ativo;

  const Medico({
    required this.id,
    required this.nome,
    required this.crm,
    required this.especialidade,
    required this.ativo,
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      id: json['id'] as int,
      nome: json['nome'] as String,
      crm: json['crm'] as String,
      especialidade: Especialidade.fromJson(
        json['especialidade'] as Map<String, dynamic>,
      ),
      ativo: json['ativo'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'crm': crm,
      'especialidade': especialidade.toJson(),
      'ativo': ativo,
    };
  }
}
