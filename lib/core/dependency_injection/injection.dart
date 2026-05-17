import 'package:get_it/get_it.dart';
import 'package:omnia_business/featurse/login/data/repos/login_repo.dart';
import 'package:omnia_business/featurse/login/logic/login_cubit.dart';


final GetIt getIt = GetIt.instance;

class GetItService {
  static Future setupGitIt() async {
    // login
   getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
   getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
    // home
    //getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());
    //getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  }
}
