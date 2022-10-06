import 'package:dio/dio.dart';
import 'package:dio_mvvm/data/remote/main_repository.dart';
import 'package:dio_mvvm/ui/home/home_vm.dart';
import 'package:get_it/get_it.dart';
import 'package:dio_mvvm/di/dio/dio_factory.dart';
import 'package:dio_mvvm/app/constants.dart';
import 'package:dio_mvvm/data/remote/episode_service.dart';
import 'package:dio_mvvm/data/domain/get_episodes.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  injector.registerSingleton<Dio>(DioFactory(baseUrl).create());
  
  injector.registerSingleton<EpisodeService>(EpisodeService(injector()));

  injector.registerSingleton<MainRepository>(MainRepository(injector()));

  injector.registerSingleton<GetEpisodes>(GetEpisodes(injector()));

  injector.registerFactory(() => HomeViewModel());
} 
