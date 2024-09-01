part of 'uploader_bloc.dart';

sealed class UploaderState extends Equatable {
  const UploaderState();
  
  @override
  List<Object> get props => [];
}

final class UploaderInitial extends UploaderState {}

//* UploadMedia States
class UploadMediaLoaded extends UploaderState {
  final String data;
  const UploadMediaLoaded(this.data);
}
class UploadMediaInitialize extends UploaderState {}
class UploadMediaLoading extends UploaderState {
  final double progress;

  const UploadMediaLoading({required this.progress});
}
class UploadMediaError extends UploaderState {
  final Failure failure;
  const UploadMediaError(this.failure);
}

//* DeleteFile States
class DeleteFileLoaded extends UploaderState {
  final SystemData<bool> status;
  final String? newFilePath;
  const DeleteFileLoaded(this.status, this.newFilePath);
}
class DeleteFileLoading extends UploaderState {}
class DeleteFileError extends UploaderState {
  final Failure failure;
  const DeleteFileError(this.failure);
}