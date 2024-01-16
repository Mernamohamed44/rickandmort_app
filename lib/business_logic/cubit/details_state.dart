
abstract class CharacterState{}
class InitialState extends CharacterState{}
class CharacterSuccessState extends CharacterState{
  final List<dynamic> character;
  CharacterSuccessState(this.character);
}