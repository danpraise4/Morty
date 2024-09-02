part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class GetMovieCharactersEvent extends AppEvent {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;

  const GetMovieCharactersEvent({
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });

  factory GetMovieCharactersEvent.fromMap(Map<String, dynamic> json) =>
      GetMovieCharactersEvent(
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
      );

  Map<String, String> get params {
    final Map<String, String> queryParams = {};

    if (name != null) queryParams['name'] = name!;
    if (status != null) queryParams['status'] = status!;
    if (species != null) queryParams['species'] = species!;
    if (type != null) queryParams['type'] = type!;
    if (gender != null) queryParams['gender'] = gender!;

    return queryParams;
  }
}
