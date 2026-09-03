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
}
