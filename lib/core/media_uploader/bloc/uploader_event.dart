part of 'uploader_bloc.dart';

sealed class UploaderEvent extends Equatable {
  const UploaderEvent();

  @override
  List<Object> get props => [];
}

//* UploadMedia Event
class UploadMediaEvent extends UploaderEvent {
  final File file;
  final String folder;

  const UploadMediaEvent({
    required this.file,
    required this.folder,
  });
}

//* DeleteFile Event
class DeleteFileEvent extends UploaderEvent {
  final String fileName;
  final String? newFilePath;

  const DeleteFileEvent({required this.fileName, this.newFilePath});

  Map<String, dynamic> get query => {
        'fileName': fileName,
      };
}
