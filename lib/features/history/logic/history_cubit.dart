import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/my_history_model.dart';
import '../data/repos/history_repo.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryRepo repo ;
  HistoryCubit(this.repo) : super(HistoryInitial());

  static  HistoryCubit get(BuildContext context) => BlocProvider.of(context);

  /// get history
  HistoryModel? historyModel ;
  void getHistory({int? day , int? month})async{
    emit(HistoryLoading());
    final result = await repo.getMyHistory(day,month);
    result.fold(
            (l){
          emit(HistoryError());
        }
        ,(r){
      historyModel = r ;
      emit(HistorySuccess());
    }
    );
  }
}
