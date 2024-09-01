import 'package:equatable/equatable.dart';

class Meta extends Equatable {
  final int? page;
  final int? limit;
  final int? totalPages;
  final int? totalData;

  const Meta({
    this.page,
    this.limit,
    this.totalPages,
    this.totalData,
  });

  @override
  List<Object?> get props => [];

  factory Meta.fromMap(Map data) => Meta(
        page: data['page'],
        limit: data['limit'],
        totalPages: data['totalPages'],
        totalData: data['totalData'],
      );
}
