import 'package:rickandmort_app/data/models/characters_model.dart';
import 'package:rickandmort_app/data/web_services/characters_api.dart';

class CharactersRepo{
  CharacterApi? characterApi;
  CharactersRepo(this.characterApi);
  Future<List<CharactersModel>> getAllCharacters() async{
    final characters= await characterApi?.getAllCharacters();
    print(characters);
    return characters!.map((character) => CharactersModel.fromJson(character)).toList();;
  }
}