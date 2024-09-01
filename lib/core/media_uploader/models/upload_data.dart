import 'package:equatable/equatable.dart';

class UploadData extends Equatable {
  final double progress;
  final String? url;

  const UploadData({
    required this.progress,
    required this.url,
  });

  @override
  List<Object?> get props => [];
}
