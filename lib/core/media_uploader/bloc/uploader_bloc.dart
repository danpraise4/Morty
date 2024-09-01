import 'package:morty/core/dependencies/service_runner.dart';
import 'package:morty/core/service_helpers/system_data.dart';
import 'package:equatable/equatable.dart';
import '../services/upload_service.dart';
import '../../errors/failure.dart';
import 'package:bloc/bloc.dart';
import 'dart:io';

part 'uploader_event.dart';
part 'uploader_state.dart';

class UploaderBloc extends Bloc<UploaderEvent, UploaderState> {
  final service = UploadService();

  UploaderBloc() : super(UploaderInitial()) {
    on<UploadMediaEvent>((event, emit) async {
      emit(UploadMediaInitialize());

      final result = await ServiceRunner<String>().runService(
        () => service.uploadFile(
          event,
          onProgress: (p0) {
            emit(UploadMediaInitialize());
            emit(UploadMediaLoading(progress: p0));
          },
        ),
      );

      emit(result.fold(
        (failure) => UploadMediaError(failure),
        (data) => UploadMediaLoaded(data),
      ));
    });
    on<DeleteFileEvent>((event, emit) async {
      emit(DeleteFileLoading());

      final result = await ServiceRunner().runService(
        () => service.deleteFile(event),
      );

      emit(result.fold(
        (failure) => DeleteFileError(failure),
        (data) => DeleteFileLoaded(data, event.newFilePath),
      ));
    });
  }
}
