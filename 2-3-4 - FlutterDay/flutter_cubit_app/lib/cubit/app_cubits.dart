import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';
import 'package:flutter_cubit/services/data_services.dart';

import '../model/data_model.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  } 
  final DataServices data;
  late final places;

  void getData() async{
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      
    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }
  goStart(){
    emit(WelcomeState());
  }
}