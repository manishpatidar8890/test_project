part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<TableItem> data;
  const HomeLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}

class HomeErrorState extends HomeState {
  final String error;
  const HomeErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
