import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/utils/dio/dio_helper.dart';
import 'package:template/core/utils/shared_preference/shared_preference_helper.dart';

final gi = GetIt.instance;

Future<void> initGi() async {
  // Repository

  final isar = await Isar.open(
    [],
    directory: await getApplicationDocumentsDirectory().then(
      (value) => value.path,
    ),
  );

  // shared preference
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  gi.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  gi.registerLazySingleton(
      () => SharedPreferencesHelper(sharedPreference: gi()));

  // data ( local + remote) repositories Objects
  gi.registerLazySingleton(() => Dio());
  gi.registerLazySingleton(() => DioHelper());
  gi.registerLazySingleton<Isar>(() => isar);

  //Isar Mangers
}
