part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class GetMovieCharatersStateLoaded extends AppState {
  final SystemData<List<CharacterModel>> character;
  const GetMovieCharatersStateLoaded(this.character);
}

class GetMovieCharaterStateLoading extends AppState {}

class GetMovieCharatersStateError extends AppState {
  final Failure failure;
  const GetMovieCharatersStateError(this.failure);
}
