import 'package:flutter/material.dart';
import 'package:rickandmort_app/app_routes.dart';
import 'package:rickandmort_app/constans/strings.dart';

void main(){
  runApp( MyApp(appRoutes: AppRoutes(),));
}
class MyApp extends StatelessWidget{
  MyApp( {super.key, required this.appRoutes});
  AppRoutes appRoutes;
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
     debugShowCheckedModeBanner: false,
     onGenerateRoute: appRoutes.generateRoutes,
   );
  }

}