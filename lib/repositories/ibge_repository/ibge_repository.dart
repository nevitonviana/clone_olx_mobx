import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/city/city.dart';
import '/models/uf/uf.dart';

class IBGERepository {
  Future<List<UF>> getUFList() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey("UF_LIST")) {
      final json = jsonDecode(preferences.getString("UF_LIST")!);
      return await json.map<UF>((e) => UF.fromJson(e)).toList()
        ..sort((UF a, UF b) =>
            a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
    } else {
      const endpoint =
          "https://servicodados.ibge.gov.br/api/v1/localidades/estados";
      try {
        final response = await Dio().get<List>(endpoint);
        preferences.setString("UF_LIST", jsonEncode(response.data));

        final ufList = response.data!.map<UF>((e) => UF.fromJson(e)).toList()
          ..sort((UF a, UF b) =>
              a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));

        return ufList;
      } on DioError {
        return Future.error("Falha ao obter a lista de estados");
      }
    }
  }

  Future<List<City>> getCityList(UF uf) async {
    final String endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios";

    try {
      final response = await Dio().get<List>(endpoint);

      final cityList = response.data!
          .map<City>((e) => City.fromJson(e))
          .toList()
        ..sort((City a, City b) =>
            a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));

      return cityList;
    } on DioError {
      return Future.error("Falha ao obter lista de cidade");
    }
  }
}
