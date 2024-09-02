import 'package:dio/dio.dart';
import 'package:morty/core/apis/api_auth.dart';
import 'package:morty/core/apis/api_endpoints.dart';
import 'package:morty/core/dependencies/dio_manager.dart';
import 'package:morty/core/errors/exception.dart';
import 'package:morty/core/helpers/response_state.dart';
import 'package:morty/core/service_helpers/meta.dart';
import 'package:morty/core/service_helpers/system_data.dart';
import 'package:morty/features/morty/app/bloc/app_bloc.dart';
import 'package:morty/features/morty/data/models/character.model.dart';

class AppRemoteSource {
  late Dio dio;
  late DioManager manager;

  AppRemoteSource() {
    dio = Dio();
    manager = DioManager(dio);

    dio.interceptors.add(InterceptorsWrapper(
      onResponse: manager.onResponse,
      onRequest: manager.onRequest,
      onError: manager.onError,
    ));
  }

  Future<SystemData<List<CharacterModel>>> getMovieCharacters(
      GetMovieCharactersEvent event) async {
    final response = await dio.get(
      charactersUrl,
      queryParameters: event.params,
      options: Options(headers: headers),
    );

    if (responseState(response.statusCode)) {
      final data = response.data;
      List<CharacterModel> characters = (data['results'] as List)
          .map((x) => CharacterModel.fromMap(x))
          .toList();
      // setStorage(key: DB., value: data['user']);

      // Remove all dio interceptors
      dio.interceptors.clear();

      return SystemData<List<CharacterModel>>(
        data: characters,
        meta: Meta(page: 1, totalData: data?['info']?['count']),
        message: data?['message'] ?? '',
      );
    } else {
      throw ServerException(response.data?['message']);
    }
  }
}
