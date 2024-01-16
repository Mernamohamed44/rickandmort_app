import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmort_app/business_logic/cubit/details_state.dart';
import 'package:rickandmort_app/data/models/characters_model.dart';
import 'package:rickandmort_app/data/repository/Characters_repository.dart';

class CharacterCubit extends Cubit<CharacterState>{
  final CharactersRepo charactersRepo;
  List<CharactersModel> characters=[];
  CharacterCubit(this.charactersRepo) : super(InitialState()) ;
  List<CharactersModel> getAllCharacters(){
    charactersRepo.getAllCharacters().then((characters) {
      emit(CharacterSuccessState(characters));
      print(characters);
      this.characters=characters;
    });
    return characters;
  }

}