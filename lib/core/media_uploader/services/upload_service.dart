import 'package:morty/core/apis/api_auth.dart';
import 'package:morty/core/apis/api_endpoints.dart';
import 'package:morty/core/errors/exception.dart';
import 'package:morty/core/extension/map_extensions.dart';
import 'package:morty/core/helpers/response_state.dart';
import 'package:morty/core/service_helpers/system_data.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart' as parser;
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import '../../dependencies/dio_manager.dart';
import '../bloc/uploader_bloc.dart';
import 'dart:convert';

class UploadService {
  late Dio dio;
  late DioManager manager;

  UploadService() {
    dio = Dio();
    manager = DioManager(dio);

    dio.interceptors.add(InterceptorsWrapper(
      onResponse: manager.onResponse,
      onRequest: manager.onRequest,
      onError: manager.onError,
    ));
  }

  Future<String> uploadFile(UploadMediaEvent event,
      {Function(double)? onProgress}) async {
    final media = event.file.path;
    final mime = lookupMimeType(media)?.split('/');

    final formData = FormData.fromMap({'folder': event.folder});
    formData.files.add(MapEntry(
      "file",
      await MultipartFile.fromFile(
        media,
        contentType: parser.MediaType(mime!.first, mime.last),
      ),
    ));

    final response = await dio.post(
      fileUrl,
      data: formData,
      options: Options(headers: headers.toFormHeaders),
      onSendProgress: (count, total) {
        onProgress?.call(count / total);
      },
    );

    if (response.statusCode == 200) {
      final data = response.data['body']['fileUrl'];
      return data;
    } else {
      throw ServerException('An unexpected error occured.');
    }
  }

  Future<SystemData<bool>> deleteFile(DeleteFileEvent event) async {
    final response = await http.delete(
      Uri.parse(fileUrl),
      body: event.query,
    );

    if (responseState(response.statusCode)) {
      return const SystemData<bool>(
        data: true,
        message: 'File deleted successfully',
        meta: null,
      );
    } else {
      throw ServerException(
        response.reasonPhrase ?? 'An unexpected error occurred',
      );
    }
  }
}
