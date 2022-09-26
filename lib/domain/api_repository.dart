import 'package:dio/dio.dart';
import 'package:wikisanchez/domain/api_model.dart';

class ApiRepositories {
  Future<List<CharacterResult>> getCharacterList(String url) async {
    try {
      final response = await Dio().get(url);
    final dt = response.data['results'];
    final dtList = (dt as List).map((e) => CharacterResult.fromJson(e)).toList();
    return dtList;    
    } catch (e) {
      throw 'something goes wrong';
      
    }
  }

  Future getInfo(String url) async {
    final response = await Dio().get(url);
    return response.data['info'];
  }

  Future getLocationList(String url)async{
    final response = await Dio().get(url);
    final dt = response.data['results'];
    final dtList = (dt as List).map((e) => ResultLocation.fromJson(e)).toList();
    return dtList;
  }

  Future getEpisodeList(String url)async{
    final response = await Dio().get(url);
    final dt = response.data['results'];
    final dtList = (dt as List).map((e) => ResultEpisode.fromJson(e)).toList();
    return dtList;
  }
  
  Future getEpisodeResult(String url)async{
    final response = await Dio().get(url);
    final dt= response.data;
    final dtList = (dt as List).map((e) => ResultEpisode.fromJson(e)).toList();
    return dtList;
  }

  Future getCharacterResult(String url)async{
    final response = await Dio().get(url);
    final dt= response.data;
    final dtList = (dt as List).map((e) =>CharacterResult.fromJson(e)).toList();
    return dtList;
  }

}
