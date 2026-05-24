import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/documents_model.dart';
import '../data/models/upcoming_meetings_model.dart';
import '../data/repos/home_repos.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo repo ;
  HomeCubit(this.repo) : super(HomeInitial());

  static HomeCubit get (context)=> BlocProvider.of(context);


  /// get upcoming Meeting
  UpcomingMeetingsModel? upcomingMeetingsModel ;
  void getUpcomingMeetings()async{
    emit(UpcomingMeetingsLoading());
    final result = await repo.getUpcomingMeetings();
    result.fold(
            (l){
          emit(UpcomingMeetingsError());
        }
        ,(r){
      upcomingMeetingsModel = r ;
      emit(UpcomingMeetingsLoaded());
    }
    );
  }


  /// get documents
  DocumentsModel? documentsModel ;
  void getDocuments()async{
    emit(DocumentsLoading());
    final result = await repo.getDocuments();
    result.fold(
            (l){
          emit(DocumentsError());
        }
        ,(r){
      documentsModel = r ;
      emit(DocumentsLoaded());
    }
    );
  }
}
