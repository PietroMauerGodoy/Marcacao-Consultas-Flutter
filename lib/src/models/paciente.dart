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

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'] as int,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      email: json['email'] as String,
      telefone: json['telefone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'telefone': telefone,
    };
  }
}
