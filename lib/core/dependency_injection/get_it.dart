import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/utils/dio/dio_helper.dart';
import 'package:template/core/utils/shared_preference/shared_preference_helper.dart';

/// GetIt is a simple service locator for Dart and Flutter projects. [GetIt]
final gi = GetIt.instance;

/// init GetIt
Future<void> initGi() async {
  // Repository

  final isar = await Isar.open(
    [],
    directory: await getApplicationDocumentsDirectory().then(
      (value) => value.path,
    ),
  );

  // shared preference
  final sharedPreferences = await SharedPreferences.getInstance();
  gi
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)

    /// [SharedPreferencesHelper] is a class that handle shared preference
    ..registerLazySingleton(
      () => SharedPreferencesHelper(sharedPreference: gi()),
    )

    // data ( local + remote) repositories Objects
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(DioHelper.new)
    ..registerLazySingleton<Isar>(() => isar);

  //Isar Mangers
}
