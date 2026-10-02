import '../models/models.dart';

const especialidadeCardiologia = Especialidade(
  id: 1,
  nome: 'Cardiologia',
  descricao: 'Cuidados com o coração',
);

const especialidadeDermatologia = Especialidade(
  id: 2,
  nome: 'Dermatologia',
  descricao: 'Cuidados com a pele',
);

const medicoRoberto = Medico(
  id: 1,
  nome: 'Dr. Roberto Silva',
  crm: 'CRM12345',
  especialidade: especialidadeCardiologia,
  ativo: true,
);

const medicaMarina = Medico(
  id: 2,
  nome: 'Dra. Marina Costa',
  crm: 'CRM67890',
  especialidade: especialidadeDermatologia,
  ativo: true,
);

const pacienteCarlos = Paciente(
  id: 1,
  nome: 'Carlos Andrade',
  cpf: '123.456.789-00',
  email: 'carlos@email.com',
  telefone: '(11) 98765-4321',
);

const pacienteAna = Paciente(
  id: 2,
  nome: 'Ana Souza',
  cpf: '987.654.321-00',
  email: 'ana@email.com',
  telefone: '(11) 91234-5678',
);

const pacienteJoao = Paciente(
  id: 3,
  nome: 'João Pereira',
  cpf: '456.789.123-00',
  email: 'joao@email.com',
  telefone: '(11) 99876-5432',
);

List<Consulta> criarConsultasMock() {
  return [
    Consulta(
      id: 1,
      medico: medicoRoberto,
      paciente: pacienteCarlos,
      data: DateTime(2026, 8, 21, 14, 30),
      valor: 350,
      status: StatusConsulta.agendada,
      observacoes: 'Consulta de rotina',
    ),
    Consulta(
      id: 2,
      medico: medicaMarina,
      paciente: pacienteAna,
      data: DateTime(2026, 8, 22, 9),
      valor: 280,
      status: StatusConsulta.agendada,
      observacoes: 'Primeira consulta',
    ),
    Consulta(
      id: 3,
      medico: medicoRoberto,
      paciente: pacienteJoao,
      data: DateTime(2026, 8, 18, 16),
      valor: 350,
      status: StatusConsulta.confirmada,
      observacoes: 'Retorno',
    ),
  ];
}
