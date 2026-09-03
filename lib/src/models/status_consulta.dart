enum StatusConsulta {
 agendada,
 confirmada,
 cancelada,
}

extension StatusConsultaRotulo on StatusConsulta {
 String get rotulo {
 return switch (this) {
 StatusConsulta.agendada => 'AGENDADA',
 StatusConsulta.confirmada => 'CONFIRMADA',
 StatusConsulta.cancelada => 'CANCELADA',
 };
 }
}
