import 'package:apicallwithbloc/cubit/news_cubit.dart';
import 'package:apicallwithbloc/domain/repositories/news_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.instance;

Future<void> initDependencyInjection() async {
  WidgetsFlutterBinding.ensureInitialized();
  _newsRepositories();
  _newsBloc();
}

void _newsRepositories() {
  inject.registerLazySingleton(() => NewsRepositories());
}

void _newsBloc() {
  inject.registerLazySingleton(() => NewsCubit(newsRepositories: inject()));
}
