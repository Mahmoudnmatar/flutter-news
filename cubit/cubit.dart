import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:news_app/remote/dio/dio_News.dart';

import '../screens/business/business_screen.dart';
import '../screens/sciences/sciences_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/sport/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentButton = 0;
  List<dynamic> business=[] ;
  List<dynamic> sport=[];
  List<dynamic> science=[];



  List<Widget> screen =[
    const BusinessScreen(),
    const SportScreen(),
    const SciencesScreen(),
    const SettingsScreen()
  ];

  void changeBottunNavBarIndex({required int index}) {

    currentButton=index;

    emit(NewsChangeBottomNabBarState());
    // if(index==1){
    //   getSportData();
    // }
    // if(index==2){
    //   getScienceData();
    // }
  }

  void getBusinessData(){
    emit(LoadingBusinessNewsState());
    if(business.isEmpty){
      try {
        DioNews.getNewsData(
            url: "v2/top-headlines",
            queryParameters: {
              "country": "us",
              "category": "business",
              "apiKey": "6e7d5ca117ef4d12bd414038ee1a81dd"
            }).then((value)  {

          business = value.data['articles'];
          emit(BusinessNewsState());
        });
      }catch(e){
        emit(ErrorGetNewsState(e.toString()));
      }
    }else{
      emit(BusinessNewsState());
    }

  }


  void getSportData(){
    emit(LoadingSportNewsState());
    if(sport.isEmpty){
      try {
        DioNews.getNewsData(
            url: 'v2/top-headlines',
            queryParameters: {
              'country': 'us',
              'category': 'sport',
              'apiKey': '6e7d5ca117ef4d12bd414038ee1a81dd'
            }).then((value) => sport=value.data['articles']);
        emit(SportNewsState());
      }catch(e){
        emit(ErrorGetNewsState(e.toString()));
      }
    }else{
      emit(SportNewsState());

    }

  }


  void getScienceData(){
    emit(LoadingSciencesNewsState());
    if(science.isEmpty){
      try {
        DioNews.getNewsData(
            url: 'v2/top-headlines',
            queryParameters: {
              'country': 'us',
              'category': 'science',
              'apiKey': '6e7d5ca117ef4d12bd414038ee1a81dd'
            }).then((value) => science=value.data['articles']);
        emit(SciencesNewsState());
      }catch(e){
        emit(ErrorGetNewsState(e.toString()));
      }
    }else{
      emit(SciencesNewsState());
    }

  }

}

