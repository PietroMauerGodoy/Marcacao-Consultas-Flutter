class Paciente {
  final int id;
  final String nome;
  final String cpf;
  final String email;
  final String? telefone;

  const Paciente({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    this.telefone,
  });
}
