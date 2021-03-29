import 'package:apicallwithbloc/domain/model/news_model.dart';
import 'package:apicallwithbloc/domain/repositories/news_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsRepositories _newsRepositories;
  NewsCubit({@required NewsRepositories newsRepositories})
      : assert(newsRepositories != null),
        _newsRepositories = newsRepositories,
        super(NewsInitial());

  Future<void> fetchNews({String message}) async {
    emit(NewsLoadingState());
    final response = await _newsRepositories.fetchData();
    if (response != null) {
      emit(NewsLoadedState(newsModel: response));
    } else {
      emit(NewsErrorState(erroeMessage: 'Failed to load..!'));
    }
  }
}
