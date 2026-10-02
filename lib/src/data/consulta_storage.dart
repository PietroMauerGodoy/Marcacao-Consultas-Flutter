import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import 'consultas_mock.dart';

class ConsultaStorage {
  static const _chave = 'consultas';

  static Future<List<Consulta>> carregar() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_chave);

    if (json == null || json.isEmpty) {
      final iniciais = criarConsultasMock();
      await salvar(iniciais);
      return iniciais;
    }

    final lista = jsonDecode(json) as List<dynamic>;
    return lista
        .map((item) => Consulta.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static Future<void> salvar(List<Consulta> consultas) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(
      consultas.map((consulta) => consulta.toJson()).toList(),
    );
    await prefs.setString(_chave, json);
  }
}
