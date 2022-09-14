import 'package:dio/dio.dart';
import 'package:wikisanchez/domain/api_model.dart';

class CharacterRepositories {
  Future<List<Result>> getDataList(String url) async {
    final response = await Dio().get(url);
    final dt = response.data['results'];
    final dtList = (dt as List).map((e) => Result.fromJson(e)).toList();
    return dtList;
  }

  Future getInfo(String url) async {
    final response = await Dio().get(url);
    return response.data['info'];
  }

  Future getDataLocation(String url)async{
    final response = await Dio().get(url);
    final dt = response.data['results'];
    final dtList = (dt as List).map((e) => ResultLocation.fromJson(e)).toList();
    return dtList;
  }

  Future getDataEpisode(String url)async{
    final response = await Dio().get(url);
    final dt = response.data['results'];
    final dtList = (dt as List).map((e) => ResultEpisode.fromJson(e)).toList();
    return dtList;
  }
}
