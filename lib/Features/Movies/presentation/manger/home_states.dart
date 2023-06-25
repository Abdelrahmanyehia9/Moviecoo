
import '../../data/model/result.dart';

abstract class HomeState {
  const HomeState();
}

class HomeSuccess extends HomeState {
  final List<Result> model;

  HomeSuccess(this.model);
}

class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}

class HomeLoading extends HomeState {}

class HomeInitial extends HomeState {}
