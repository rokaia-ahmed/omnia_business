import 'package:get_it/get_it.dart';


final GetIt getIt = GetIt.instance;

class GetItService {
  static Future setupGitIt() async {
    // login
   // getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
   //getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

    // home
    //getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());
    //getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  }
}
