class CharactersModel {
  CharactersModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location? origin;
  final Location? location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime? created;

  CharactersModel copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Location? origin,
    Location? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) {
    return CharactersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }

  factory CharactersModel.fromJson(Map<String, dynamic> json){
    return CharactersModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      status: json["status"] ?? "",
      species: json["species"] ?? "",
      type: json["type"] ?? "",
      gender: json["gender"] ?? "",
      origin: json["origin"] == null ? null : Location.fromJson(json["origin"]),
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
      image: json["image"] ?? "",
      episode: json["episode"] == null ? [] : List<String>.from(json["episode"]!.map((x) => x)),
      url: json["url"] ?? "",
      created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );
  }

}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  Location copyWith({
    String? name,
    String? url,
  }) {
    return Location(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      name: json["name"] ?? "",
      url: json["url"] ?? "",
    );
  }

}
