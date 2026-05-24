import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnia_business/features/calendar/data/models/timeline_model.dart';
import 'package:omnia_business/features/calendar/data/repos/calendar_repo.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarRepo repo ;
  CalendarCubit(this.repo) : super(CalendarInitial());

  static CalendarCubit get(BuildContext context) => BlocProvider.of(context);

  /// get timeline
  TimelineModel? timelineModel ;
  void getTimeline(String date)async{
    emit(CalendarLoading());
    final result = await repo.getTimeLine(date: date);
    result.fold(
            (l){
          emit(CalendarError());
        }
        ,(r){
      timelineModel = r ;
      emit(CalendarLoaded());
    }
    );
  }
}
