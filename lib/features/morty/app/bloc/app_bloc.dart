import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:morty/core/errors/failure.dart';
import 'package:morty/core/service_helpers/system_data.dart';
import 'package:morty/features/morty/data/models/character.model.dart';
import 'package:morty/features/morty/data/repository/app_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppRepository repo = AppRepository();

  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {});

    on<GetMovieCharactersEvent>((event, emit) async {
      emit(GetMovieCharaterStateLoading());
      final result = await repo.getMovieCharacters(event);
      emit(result.fold((error) => GetMovieCharatersStateError(error),
          (data) => GetMovieCharatersStateLoaded(data)));
    });
  }
}
