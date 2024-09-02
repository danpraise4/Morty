class CharacterLocationModel {
  final String name;
  final String url;

  CharacterLocationModel({
    required this.name,
    required this.url,
  });

  CharacterLocationModel copyWith({
    String? name,
    String? url,
  }) =>
      CharacterLocationModel(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory CharacterLocationModel.fromMap(Map<String, dynamic> json) =>
      CharacterLocationModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
