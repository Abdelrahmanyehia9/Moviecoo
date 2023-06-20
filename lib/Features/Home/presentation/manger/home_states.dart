import 'package:moviecoo/Features/Home/data/model/movie_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeSuccess extends HomeState {
  final List<MovieModel> model;

  HomeSuccess(this.model);
}

class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}

class HomeLoading extends HomeState {}

class HomeInitial extends HomeState {}
