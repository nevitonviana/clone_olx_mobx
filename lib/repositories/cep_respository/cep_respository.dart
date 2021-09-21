import 'package:dio/dio.dart';
import 'package:olx_clone/models/address/address.dart';
import 'package:olx_clone/models/city/city.dart';
import 'package:olx_clone/repositories/ibge_repository/ibge_repository.dart';

class CepRepository {
  Future<Address> getAddressFrommAPI(String cep) async {
    if (cep.isEmpty) return Future.error("Cep Invalido");
    final clearCep = cep.replaceAll(RegExp('[^0-9]'), "");
    if (clearCep.length != 8) return Future.error("Cep Invalido");

    final endpoint = "https://viacep.com.br/ws/$clearCep/json";

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data!.containsKey('erro') && response.data!['erro'])
        return Future.error("Cep Invalido");

      final urList = await IBGERepository().getUFList();

      return Address(
          uf: urList.firstWhere(
              (element) => element.initials == response.data!['uf']),
          city: City(name: response.data!['localidade']),
          cep: response.data!['cep'],
          district: response.data!['bairro']);
    } catch (e) {
      return Future.error("Não foi posivel busca o sua cep");
    }
  }
}
