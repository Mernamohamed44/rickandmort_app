import 'package:dio/dio.dart';
import 'package:rickandmort_app/constans/strings.dart';
import 'package:rickandmort_app/data/models/characters_model.dart';

class CharacterApi{
  Dio?dio;
 CharacterApi(){
   BaseOptions baseOptions=BaseOptions(
       baseUrl: baseUrl,
       receiveTimeout: 20*1000,
       sendTimeout: 20*1000,
       receiveDataWhenStatusError: false
   );
   dio=Dio(baseOptions);
 }
  Future<List<dynamic>>getAllCharacters() async{
    try{
      Response response=await dio!.get('character');
      print(response.data.toString());
      return response.data["results"];
    }
    catch(e){
      print(e.toString());
      return [];
    }
    }
  }