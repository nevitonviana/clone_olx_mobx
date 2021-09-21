import 'package:dio/dio.dart';

import '/models/uf/uf.dart';

class IBGERepository {
  Future<List<UF>> getUFListFromAPI() async {
    const endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados";
    try {
      final response = await Dio().get<List>(endpoint);
      final ufList = response.data!.map<UF>((e) => UF.fromJson(e)).toList()
        ..sort(
            (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));

      return ufList;
    } on DioError {
      return Future.error("Falha ao obter a lista de estados");
    }
  }

  getCityListFromAPI() {}
}
