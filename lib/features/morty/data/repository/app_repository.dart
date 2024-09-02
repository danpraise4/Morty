import 'package:dartz/dartz.dart';
import 'package:morty/core/dependencies/service_runner.dart';
import 'package:morty/core/errors/failure.dart';
import 'package:morty/core/service_helpers/system_data.dart';
import 'package:morty/features/morty/app/bloc/app_bloc.dart';
import 'package:morty/features/morty/data/models/character.model.dart';
import 'package:morty/features/morty/data/source/app_source.dart';

class AppRepository {
  var source = AppRemoteSource();

  Future<Either<Failure, SystemData<List<CharacterModel>>>> getMovieCharacters(
      GetMovieCharactersEvent params) async {
    return await ServiceRunner<SystemData<List<CharacterModel>>>().runService(
      () => source.getMovieCharacters(params),
    );
  }

}
