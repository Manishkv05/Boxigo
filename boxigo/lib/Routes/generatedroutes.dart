
import 'dart:ffi';


import 'package:boxigo/Business%20logics/darshboard_bloc/dashboard_bloc.dart';
import 'package:boxigo/Screens/dashboard.dart';
import 'package:boxigo/Screens/landingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

class Generatedroutes{
  final DashboardBloc dashboardBloc=DashboardBloc();
  Route<dynamic> generatedRoutes(RouteSettings settings){
    final args=settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=>
        BlocProvider<DashboardBloc>.value(
          value:dashboardBloc,
          child:const Landingscreen(),
        ),
       
          
        );
   
      default:
      return _errorRout();
      
    }

  }
  static Route<dynamic> _errorRout(){
    return MaterialPageRoute(builder: (_){
  return Scaffold(
    appBar: AppBar(title: Text("Error"),),
    body:Center(child: Text('Error')),
  );
    });
  }
}