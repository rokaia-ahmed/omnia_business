import 'package:get_it/get_it.dart';
import 'package:omnia_business/features/calendar/data/repos/calendar_repo.dart';
import 'package:omnia_business/features/calendar/logic/calendar_cubit.dart';
import 'package:omnia_business/features/history/data/repos/history_repo.dart';

import '../../features/history/logic/history_cubit.dart';
import '../../features/home/data/repos/home_repos.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';


final GetIt getIt = GetIt.instance;

class GetItService {
  static Future setupGitIt() async {
    // login
   getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
   getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
    // home
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

   // history
   getIt.registerLazySingleton<HistoryRepo>(() => HistoryRepo());
   getIt.registerFactory<HistoryCubit>(() => HistoryCubit(getIt()));

   // calendar
   getIt.registerLazySingleton<CalendarRepo>(() => CalendarRepo());
   getIt.registerFactory<CalendarCubit>(() => CalendarCubit(getIt()));

  }
}
