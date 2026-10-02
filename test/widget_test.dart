import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcacao_consultas_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('updates consultations by id and persists their statuses', (
    tester,
  ) async {
    await tester.pumpWidget(const MarcacaoConsultasApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Carlos Andrade'), findsOneWidget);

    final confirmar = find.text('Confirmar').first;
    await tester.ensureVisible(confirmar);
    await tester.pumpAndSettle();
    await tester.tap(confirmar);
    await tester.pumpAndSettle();

    expect(find.text('Consulta confirmada com sucesso!'), findsOneWidget);

    final ana = find.text('Ana Souza');
    await tester.scrollUntilVisible(ana, 300);
    expect(ana, findsOneWidget);
    expect(find.text('AGENDADA'), findsOneWidget);

    final cancelar = find.text('Cancelar').first;
    await tester.ensureVisible(cancelar);
    await tester.pumpAndSettle();
    await tester.tap(cancelar);
    await tester.pumpAndSettle();

    expect(find.text('Consulta cancelada'), findsOneWidget);

    final preferences = await SharedPreferences.getInstance();
    final saved = jsonDecode(preferences.getString('consultas')!) as List;
    expect(saved[0]['status'], 'confirmada');
    expect(saved[1]['status'], 'cancelada');
    expect(saved[2]['status'], 'confirmada');

    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(const MarcacaoConsultasApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    await tester.scrollUntilVisible(find.text('Carlos Andrade'), 300);
    expect(find.text('CONFIRMADA'), findsAtLeastNWidgets(1));
    await tester.scrollUntilVisible(find.text('Ana Souza'), 300);
    expect(find.text('CANCELADA'), findsAtLeastNWidgets(1));
  });

  testWidgets('opens consultation details without action buttons', (
    tester,
  ) async {
    await tester.pumpWidget(const MarcacaoConsultasApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    final detalhes = find.text('Ver Detalhes').first;
    await tester.ensureVisible(detalhes);
    await tester.pumpAndSettle();
    await tester.tap(detalhes);
    await tester.pumpAndSettle();

    expect(find.text('Detalhes da consulta'), findsOneWidget);
    expect(find.text('Carlos Andrade'), findsOneWidget);
    expect(find.text('Confirmar'), findsNothing);
    expect(find.text('Cancelar'), findsNothing);
    expect(find.text('Ver Detalhes'), findsNothing);
  });
}
