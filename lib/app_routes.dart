import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmort_app/business_logic/cubit/detials_cubit.dart';
import 'package:rickandmort_app/data/repository/Characters_repository.dart';
import 'package:rickandmort_app/data/web_services/characters_api.dart';

import 'presentation/screens/character_screen.dart';
import 'presentation/screens/character_details_screen.dart';

class AppRoutes{
  late CharactersRepo charactersRepo;
  late CharacterCubit characterCubit;
  AppRoutes(){
    charactersRepo=CharactersRepo(CharacterApi());
    characterCubit=CharacterCubit(charactersRepo);
  }
  Route ? generateRoutes(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> BlocProvider(
          create: (context)=>characterCubit,
          child:  CharacterScreen(),
        ));
         case 'characterDetailsScreen':
           return MaterialPageRoute(builder: (_)=>const CharacterDetailsScreen());
    }

  }
}