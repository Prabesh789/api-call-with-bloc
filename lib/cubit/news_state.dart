part of 'news_cubit.dart';

// abstract class NewsState extends Equatable {
//   const NewsState();

//   @override
//   List<Object> get props => [];
// }

// class NewsInitial extends NewsState {}

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {
  final NewsModel newsModel;

  NewsLoadedState({this.newsModel});
  @override
  List<Object> get props => [];
}

class NewsErrorState extends NewsState {
  final String erroeMessage;

  NewsErrorState({this.erroeMessage});
  @override
  List<Object> get props => [];
}
